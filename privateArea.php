<?php
session_start();

if (!isset($_SESSION["username"])) { 
    header("Location: index.php"); 
    exit(); 
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area riservata</title>
</head>
<body>
    <h1>Area riservata</h1>

    <a href="logout.php">Logout</a>
</body>
</html>