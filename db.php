<?php
// Railway environment variables ဖတ်ပါ
$host = getenv('DB_HOST') ?: 'localhost';
$port = getenv('DB_PORT') ?: 3306;
$user = getenv('DB_USERNAME') ?: 'root';
$pass = getenv('DB_PASSWORD') ?: '';
$dbname = getenv('DB_DATABASE') ?: 'canteen';

// Connection ဖန်တီးပါ
$conn = new mysqli($host, $user, $pass, $dbname, $port);

// Error စစ်ပါ
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Character set
$conn->set_charset("utf8mb4");
?>