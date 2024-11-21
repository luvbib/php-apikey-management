<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Documentation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        pre {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
        }
        .doc-section {
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.php">API Service</a>
        </div>
    </nav>

    <div class="container my-5">
        <h1 class="mb-4">API Documentation</h1>

        <div class="doc-section">
            <h2>Authentication</h2>
            <p>All API requests require an API key to be included in the URL as a GET parameter.</p>
            <pre>https://your-domain.com/api/endpoint?apikey=YOUR_API_KEY</pre>
        </div>

        <div class="doc-section">
            <h2>Example Usage</h2>
            <p>Here's an example of how to use the API:</p>
            <pre>GET https://your-domain.com/api/endpoint?apikey=abc123</pre>
            
            <h3>Response Format</h3>
            <pre>{
    "status": "success",
    "message": "Request successful",
    "data": {
        // Response data here
    }
}</pre>
        </div>

        <div class="doc-section">
            <h2>Error Codes</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>401</td>
                        <td>Invalid API Key</td>
                    </tr>
                    <tr>
                        <td>403</td>
                        <td>API Key Expired or Banned</td>
                    </tr>
                    <tr>
                        <td>429</td>
                        <td>Device Limit Exceeded</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
