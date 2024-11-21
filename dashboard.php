<?php
session_start();
require_once 'config/database.php';

if(!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit();
}

// Handle API Key Operations
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(isset($_POST['action'])) {
        switch($_POST['action']) {
            case 'create_key':
                $license_key = bin2hex(random_bytes(16));
                $plan_type = $_POST['plan_type'];
                $device_limit = $_POST['device_limit'];
                $expiry_date = $_POST['expiry_date'];
                
                $stmt = $pdo->prepare("INSERT INTO api_keys (license_key, plan_type, device_limit, expiry_date) VALUES (?, ?, ?, ?)");
                $stmt->execute([$license_key, $plan_type, $device_limit, $expiry_date]);
                break;
                
            case 'toggle_ban':
                $key_id = $_POST['key_id'];
                $status = $_POST['status'] == 'active' ? 'banned' : 'active';
                
                $stmt = $pdo->prepare("UPDATE api_keys SET status = ? WHERE id = ?");
                $stmt->execute([$status, $key_id]);
                break;
                
            case 'delete_key':
                $key_id = $_POST['key_id'];
                
                // Begin transaction
                $pdo->beginTransaction();
                try {
                    // Get the license key first
                    $stmt = $pdo->prepare("SELECT license_key FROM api_keys WHERE id = ?");
                    $stmt->execute([$key_id]);
                    $license_key = $stmt->fetch(PDO::FETCH_COLUMN);
                    
                    // Delete related usage records first
                    $stmt = $pdo->prepare("DELETE FROM api_usage WHERE license_key = ?");
                    $stmt->execute([$license_key]);
                    
                    // Then delete the API key
                    $stmt = $pdo->prepare("DELETE FROM api_keys WHERE id = ?");
                    $stmt->execute([$key_id]);
                    
                    $pdo->commit();
                } catch(Exception $e) {
                    $pdo->rollBack();
                    throw $e;
                }
                break;
                
            case 'update_message':
                $key_id = $_POST['key_id'];
                $message = $_POST['message'];
                
                $stmt = $pdo->prepare("UPDATE api_keys SET custom_message = ? WHERE id = ?");
                $stmt->execute([$message, $key_id]);
                break;
        }
    }
}

// Get API Keys
$stmt = $pdo->query("SELECT * FROM api_keys ORDER BY created_at DESC");
$api_keys = $stmt->fetchAll();

// Get Usage Statistics
$stmt = $pdo->query("SELECT COUNT(*) as total_keys FROM api_keys");
$total_keys = $stmt->fetch()['total_keys'];

$stmt = $pdo->query("SELECT COUNT(*) as active_keys FROM api_keys WHERE status = 'active'");
$active_keys = $stmt->fetch()['active_keys'];

// Get usage data for chart
$stmt = $pdo->query("SELECT DATE(request_date) as date, COUNT(*) as count FROM api_usage GROUP BY DATE(request_date) ORDER BY date DESC LIMIT 7");
$usage_data = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .dashboard-container {
            padding: 20px;
        }
        .stats-card {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">API Panel</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="logout.php">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container dashboard-container">
        <div class="row">
            <div class="col-md-4">
                <div class="stats-card animate__animated animate__fadeIn">
                    <h4>Total Keys</h4>
                    <h2><?php echo $total_keys; ?></h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card animate__animated animate__fadeIn">
                    <h4>Active Keys</h4>
                    <h2><?php echo $active_keys; ?></h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card animate__animated animate__fadeIn">
                    <h4>Usage Today</h4>
                    <h2><?php echo $usage_data[0]['count'] ?? 0; ?></h2>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8">
                <canvas id="usageChart"></canvas>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Create New API Key</h5>
                        <form method="POST">
                            <input type="hidden" name="action" value="create_key">
                            <div class="mb-3">
                                <label class="form-label">Plan Type</label>
                                <select name="plan_type" class="form-control" required>
                                    <option value="demo">Demo</option>
                                    <option value="monthly">Monthly</option>
                                    <option value="yearly">Yearly</option>
                                    <option value="custom">Custom</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Request Limit</label>
                                <input type="number" name="device_limit" class="form-control" required min="1">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Expiry Date</label>
                                <input type="datetime-local" name="expiry_date" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Create Key</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive mt-4">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>License Key</th>
                        <th>Status</th>
                        <th>Plan</th>
                        <th>Limit</th>
                        <th>Expiry</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($api_keys as $key): ?>
                    <tr>
                        <td><?php echo $key['license_key']; ?></td>
                        <td>
                            <span class="badge bg-<?php echo $key['status'] == 'active' ? 'success' : 'danger'; ?>">
                                <?php echo $key['status']; ?>
                            </span>
                        </td>
                        <td><?php echo $key['plan_type']; ?></td>
                        <td><?php echo $key['used_devices']; ?>/<?php echo $key['device_limit']; ?></td>
                        <td><?php echo $key['expiry_date']; ?></td>
                        <td>
                            <form method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="toggle_ban">
                                <input type="hidden" name="key_id" value="<?php echo $key['id']; ?>">
                                <input type="hidden" name="status" value="<?php echo $key['status']; ?>">
                                <button type="submit" class="btn btn-warning btn-sm">
                                    <?php echo $key['status'] == 'active' ? 'Ban' : 'Unban'; ?>
                                </button>
                            </form>
                            <form method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="delete_key">
                                <input type="hidden" name="key_id" value="<?php echo $key['id']; ?>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Usage Chart
        const ctx = document.getElementById('usageChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: <?php echo json_encode(array_column(array_reverse($usage_data), 'date')); ?>,
                datasets: [{
                    label: 'API Usage',
                    data: <?php echo json_encode(array_column(array_reverse($usage_data), 'count')); ?>,
                    borderColor: '#3498db',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>