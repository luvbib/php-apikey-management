<?php
require_once 'config/database.php';

header('Content-Type: application/json');

function response($status, $message, $data = null) {
    echo json_encode([
        'status' => $status,
        'message' => $message,
        'data' => $data
    ]);
    exit;
}

// Check if API key is provided
if(!isset($_GET['apikey'])) {
    response('error', 'API key is required');
}

$apikey = $_GET['apikey'];

// Validate API key
$stmt = $pdo->prepare("SELECT * FROM api_keys WHERE license_key = ?");
$stmt->execute([$apikey]);
$key = $stmt->fetch();

if(!$key) {
    response('error', 'Invalid API key');
}

if($key['status'] == 'banned') {
    response('error', 'API key is banned');
}

if(strtotime($key['expiry_date']) < time()) {
    response('error', 'API key has expired');
}

if($key['used_devices'] >= $key['device_limit']) {
    response('error', 'Device limit exceeded');
}

// Log API usage
$stmt = $pdo->prepare("INSERT INTO api_usage (license_key) VALUES (?)");
$stmt->execute([$apikey]);

// Update used devices count
$stmt = $pdo->prepare("UPDATE api_keys SET used_devices = used_devices + 1 WHERE license_key = ? AND used_devices < device_limit");
$stmt->execute([$apikey]);

// Return success response
response('success', 'API request successful', [
    'plan' => $key['plan_type'],
    'message' => $key['custom_message']
]);
