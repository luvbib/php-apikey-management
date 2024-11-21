<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Documentation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .hero {
            background: linear-gradient(120deg, #2980b9, #8e44ad);
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        .feature-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <div class="hero">
        <div class="container text-center animate__animated animate__fadeIn">
            <h1>API Service</h1>
            <p class="lead">Powerful, Reliable, and Secure API Solutions</p>
            <a href="docs.php" class="btn btn-light btn-lg">View Documentation</a>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="feature-card animate__animated animate__fadeInUp">
                    <h3>Easy Integration</h3>
                    <p>Simple API endpoints with comprehensive documentation</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card animate__animated animate__fadeInUp" style="animation-delay: 0.2s">
                    <h3>Secure</h3>
                    <p>API key authentication and robust security measures</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card animate__animated animate__fadeInUp" style="animation-delay: 0.4s">
                    <h3>Scalable</h3>
                    <p>Built to handle high-volume requests efficiently</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
