<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area utente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style.css">
</head>
<body>

    <?php require_once(__DIR__ . '/../includes/header.php'); ?>
    
        <div class="container mt-4 flex-grow-1">
            <form action="">
                <input type="text">
                <button class="btn btn-primary">Cerca</button>
            </form>
        </div>

    <?php require_once(__DIR__ . '/../includes/footer.php'); ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>