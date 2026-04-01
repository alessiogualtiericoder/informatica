<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/config/connection.php');
require_once(__DIR__ . '/includes/user_obj.php');

$username = $_SESSION["username"] ?? '';
 
if (isset($username)) {
    if ($_SESSION['id_profilo'] == 1) {
        header("Location: /pages/admin/admin_area.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevobis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-dark text-white"> 
    <?php require_once("includes/header.php"); ?>

    <main class="container flex-grow-1 d-flex flex-column justify-content-center align-items-center py-5">
        
        <div class="text-center mb-5 mt-md-4">
            <h1 class="display-3 fw-bold mb-3">Cinevobis</h1>
        </div>

        
        <div class="w-100 mb-5 px-3" style="max-width: 600px;">
            <form action="/pages/public/search.php" method="GET" class="position-relative">
                <i class="bi bi-search position-absolute text-white-50 fs-5" style="top: 50%; left: 20px; transform: translateY(-50%);"></i>
                <input type="search" name="search" class="form-control form-control-lg py-3 bg-transparent border-secondary text-white rounded-pill ps-5 shadow-none" placeholder="Cerca un film..." aria-label="Cerca">
            </form>
        </div>

        <div class="row g-5 w-100 justify-content-center mb-5 text-center" style="max-width: 900px;">
            <div class="col-md-5">
                <i class="bi bi-bookmark fs-2 text-white-50 mb-3 d-inline-block"></i>
                <h2 class="h5 fw-semibold mb-2">Tieni traccia</h2>
                <p class="text-white-50 fs-6 m-0">Non dimenticare mai i film che hai visto o che vuoi vedere in futuro.</p>
            </div>
            <div class="col-md-5">
                <i class="bi bi-compass fs-2 text-white-50 mb-3 d-inline-block"></i>
                <h2 class="h5 fw-semibold mb-2">Esplora</h2>
                <p class="text-white-50 fs-6 m-0">Scopri nuovi generi e trova il tuo prossimo film preferito con facilità.</p>
            </div>
        </div>

        <div class="row justify-content-center mt-4 w-100" style="max-width: 800px;">
            <div class="col-12 text-center">
                <hr class="border-secondary mb-5 opacity-25">
                
                <h3 class="h4 fw-bold mb-4">La missione</h3>
                <p class="lead text-white-50 mb-4 px-md-5">
                    Cinevobis nasce per creare uno spazio digitale essenziale dove ogni cinefilo possa sentirsi a casa. 
                    Organizza la tua cineteca virtuale e arricchisci una community in continua evoluzione.
                </p>

                <?php if (!isset($_SESSION['username'])): ?>
                    <div class="mt-5">
                        <a href="/actions/signup.php" class="btn btn-light btn-lg px-5 py-3 rounded-pill fs-6 fw-medium transition-all">
                            Crea il tuo account gratuito
                        </a>
                    </div>
                </div>
            <?php endif; ?>
        </div>
              
    </main>

    <?php require_once("includes/footer.php"); ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>