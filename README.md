# API Panel Management System

A comprehensive API key management system with admin dashboard, built using PHP and MySQL.

## Features

- 🔐 Secure Admin Authentication
- 🎯 API Key Management
  - Generate new API keys
  - Set device limits
  - Configure expiration dates
  - Multiple plan types support
- 📊 Usage Statistics Dashboard
  - Real-time usage tracking
  - Visual data representation
  - Active keys monitoring
- 🛡️ Security Features
  - API key validation
  - Ban/Unban functionality
  - Device limit enforcement

## Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx)
- PDO PHP Extension
- Modern web browser

## Installation

1. Clone the repository to your web server directory
2. Create a MySQL database named `api_panel`
3. Import the database schema (schema will be provided)
4. Configure database connection in `config/database.php`:
   ```php
   $host = 'localhost';
   $dbname = 'api_panel';
   $username = 'your_username';
   $password = 'your_password';
   ```

## Project Structure

```
api_panel/
├── config/
│   └── database.php
├── dashboard.php
├── docs.php
├── index.php
├── login.php
└── README.md
```

## Usage

### Admin Login
- Access the login page at `login.php`
- Use your admin credentials to log in
- You'll be redirected to the dashboard

### Managing API Keys
1. Create new API keys with:
   - Plan type selection
   - Device limit configuration
   - Expiration date setting
2. Monitor existing keys
3. Ban/Unban keys as needed
4. Delete unused keys

### API Documentation
- Public API documentation available at `docs.php`
- Includes authentication details
- Error codes reference
- Usage examples

## Security Considerations

- All API requests require valid API keys
- Keys can be banned if misused
- Device limits are strictly enforced
- Admin authentication required for management
- Password hashing implemented for security

## Screenshot
<img src="https://raw.githubusercontent.com/luvbib/php-apikey-management/refs/heads/main/api.png">

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the repository or contact the system administrator.
