<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        <?php include 'index.css'; ?>
    </style>
    <title>Sustav za Zračne Luke</title>
</head>
<body style="font-family:Verdana;color:#aaaaaa;">

<div class="header">
    <h1>Sustav za Zračne Luke</h1>
</div>

<div class="menu">
    <a href="passengers" class="button-link">Putnici</a>
    <a href="flights" class="button-link">Letovi</a>
    <a href="airports" class="button-link">Zračne Luke</a>
</div>

<div class="main">
    <?php require_once('Routes.php')?>
</div>

</body>
</html>