<?php
session_start();
date_default_timezone_set('Europe/Rome');
require_once(__DIR__ . '/../../config/connection.php');
require_once(__DIR__ . '/../../includes/user_obj.php');

$errore = "";
$film = null;
$persone = [];

$id_film = $_GET['id'] ?? null;

if (!empty($id_film)) {
    try {
        $sql = "SELECT f.*, p.nome, p.cognome 
                FROM films f
                LEFT JOIN films_persone fp ON f.id_film = fp.id_film
                LEFT JOIN persone p ON fp.id_persona = p.id_persona
                WHERE f.id_film = :id";

        $stmt = $conn->prepare($sql);
        $stmt->execute([':id' => $id_film]);
        $rows = $stmt->fetchAll();
        
        if (empty($rows)) {
            $errore = "Nessun film trovato con questo ID";
        } else {
            $film = $rows[0];
            
            foreach ($rows as $row) {
                if (!empty($row['nome']) || !empty($row['cognome'])) {
                    $persone[] = trim($row['nome'] . ' ' . $row['cognome']);
                }
            }
            $persone = array_unique($persone); // Elimina le persone ripetute
        }

    } catch (PDOException $e) {
        $errore = "Errore nel database: " . $e->getMessage();
    }
} else {
    $errore = "Nessun film selezionato";
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $film ? htmlspecialchars($film['titolo']) : 'Film' ?> - Cinevobis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <?php require_once(__DIR__ . '/../../includes/header.php'); ?>

    <main class="container mt-5 mb-5 flex-grow-1">
        <?php if ($errore): ?>
            <div class="alert alert-danger text-center shadow-sm rounded-3">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> <?= htmlspecialchars($errore) ?>
            </div>

        <?php elseif ($film): ?>
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="card border-0 shadow-sm rounded-4">
                        <div class="card-body p-5">
                            <h1 class="card-title fw-bold mb-4"><?= htmlspecialchars($film['titolo']) ?></h1>
                            
                            <h5 class="text-muted fw-semibold mb-3">Trama</h5>
                            <p class="card-text fs-6 text-secondary lh-lg mb-4">
                                <!-- Restituisce la stringa string con <br /> inserito prima di tutti i newline -->
                                <?= nl2br(htmlspecialchars($film['trama'])) ?> 
                            </p>

                            <?php if (!empty($persone)): ?>
                                <h5 class="text-muted fw-semibold mb-3">Cast & Crew</h5>
                                <div class="d-flex flex-wrap gap-2 mb-5">
                                    <?php foreach ($persone as $persona): ?>
                                        <span class="badge bg-light text-dark border px-3 py-2 rounded-pill fs-6 fw-normal">
                                            <i class="bi bi-person-circle me-1 text-secondary"></i> <?= htmlspecialchars($persona) ?>
                                        </span>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                            
                            <hr class="text-muted opacity-25 mb-4">
                            
                            <div class="row text-center text-md-start g-4">
                                <div class="col-md-4">
                                    <div class="text-uppercase text-muted small fw-bold tracking-wide mb-1">Durata</div>
                                    <div class="fs-5 fw-medium"><i class="bi bi-clock text-primary me-2"></i><?= htmlspecialchars($film['durata_minuti']) ?> min</div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-uppercase text-muted small fw-bold tracking-wide mb-1">Anno di Uscita</div>
                                    <div class="fs-5 fw-medium"><i class="bi bi-calendar3 text-primary me-2"></i><?= htmlspecialchars(date('Y', strtotime($film['data_uscita']))) ?></div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-uppercase text-muted small fw-bold tracking-wide mb-1">Paese di produzione</div>
                                    <div class="fs-5 fw-medium"><i class="bi bi-globe text-primary me-2"></i><?= htmlspecialchars(strtoupper($film['iso_code'])) ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </main>

    <?php require_once(__DIR__ . '/../../includes/footer.php'); ?>
    
</body>
</html>