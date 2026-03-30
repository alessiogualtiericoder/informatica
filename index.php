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
        
        <div class="text-center mb-4 mt-md-4">
            <h1 class="display-1 fw-bolder text-gradient mb-2">
                Cinevobis
            </h1>
            <p class="lead fs-3 fw-light text-light text-opacity-75">Il cinema a portata di mano</p>
        </div>

        <div class="w-100 mb-5 px-3 search-wrapper" style="max-width: 650px;" data-bs-theme="dark">
            <form action="/pages/public/search.php" method="GET" class="position-relative">
                <input type="search" name="search" class="form-control form-control-lg py-3 bg-secondary bg-opacity-10 border-secondary rounded-pill text-white ps-5 shadow-none" placeholder="Cerca un film..." aria-label="Cerca">
                <i class="bi bi-search position-absolute text-secondary fs-5" style="top: 50%; left: 24px; transform: translateY(-50%);"></i>
            </form>
        </div>

        <div class="row g-4 w-100 justify-content-center mb-2" style="max-width: 1000px;">
            <div class="col-md-5">
                <div class="feature-card h-100 text-center p-5 rounded-4 bg-secondary bg-opacity-10 border border-secondary border-opacity-50">
                    <i class="bi bi-bookmark-check fs-1 text-primary mb-3 d-inline-block"></i>
                    <h2 class="h3 fw-bold mb-3">Tieni traccia</h2>
                    <p class="text-secondary m-0">Non dimenticare mai i film che hai visto o che vuoi vedere in futuro.</p>
                </div>
            </div>
            <div class="col-md-5">
                <div class="feature-card h-100 text-center p-5 rounded-4 bg-secondary bg-opacity-10 border border-secondary border-opacity-50">
                    <i class="bi bi-compass fs-1 text-primary mb-3 d-inline-block"></i>
                    <h2 class="h3 fw-bold mb-3">Esplora</h2>
                    <p class="text-secondary m-0">Scopri nuovi generi e trova il tuo prossimo film preferito con facilità.</p>
                </div>
            </div>
        </div>

        <?php if (!isset($_SESSION['username'])): ?>
            <div class="mt-5">
                <a href="/pages/public/discover.php" class="btn btn-primary btn-lg px-5 py-3 rounded-pill fw-bold shadow-sm transition-all hover-scale">
                    Scopri chi siamo
                </a>
            </div>
        <?php endif; ?>

    </main>

    <?php require_once("includes/footer.php"); ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>