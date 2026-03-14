<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once("connection.php");
require_once("userObj.php");

$errore = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);

    try {
        $user = new userObj($conn, $username, $password);
        $utente = $user->findByUsername();

        // Verifica l'hash della password inserita con l'hash della password salvata nel DB
        // Verifica dati idonei
        if ($utente && password_verify($password, $utente['password'])) {
            if ($utente['attivo'] != 0) {
                if ($utente['idProfilo'] == 1) {
                    session_regenerate_id(true);

                    $idSessione = session_id();
                    $_SESSION['id_utente'] = $utente['id'];
                    $_SESSION['username']  = $utente['username'];

                    $user->createDataLogin(date('Y-m-d H:i:s'), $idSessione, $utente['id']);

                    header("Location: privateArea.php");
                    exit();
                }

                if ($utente['idProfilo'] == 2) {
                    session_regenerate_id(true);

                    $idSessione = session_id();
                    $_SESSION['id_utente'] = $utente['id'];
                    $_SESSION['username']  = $utente['username'];

                    $user->createDataLogin(date('Y-m-d H:i:s'), $idSessione, $utente['id']);

                    header("Location: userArea.php");
                    exit();
                }
            } else {
                $errore = "Utente non attivo";
            }
        } else {
            $errore = "Dati non validi";
        }   
    } catch (PDOException $e) {
        $errore = "Errore: " . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    <style>
    body{
        background:#f5f5f5;
    }
    </style>
</head>
<body>

<div class="container vh-100 d-flex justify-content-center align-items-center">

    <div class="card shadow p-4" style="width:400px">

        <h3 class="text-center mb-4">Login</h3>

        <?php if ($errore): ?>
            <div class="alert alert-danger">
                <?= htmlspecialchars($errore) ?>
            </div>
        <?php endif; ?>

        <form method="POST">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" 
                       name="username" 
                       class="form-control" 
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" 
                       name="password" 
                       class="form-control" 
                       required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    Accedi
                </button>
            </div>

        </form>

        <div class="text-center mt-3">
            Sei nuovo?
            <a href="registration.php">Registrati</a>
        </div>

    </div>

    <?php require_once("footer.php"); ?>
</div>
</body>
</html>