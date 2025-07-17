<?php
include "db.php";
$result = $conn->query("SELECT * FROM movies");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Movies</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Now Showing</h1>
<div class="movie-list">
    <?php while ($row = $result->fetch_assoc()) { ?>
        <div class="movie-card">
            <h3><?= $row['title'] ?></h3>
            <p><?= $row['description'] ?></p>
            <a href="showtime.php?movie_id=<?= $row['movie_id'] ?>">View Showtimes</a>
        </div>
    <?php } ?>
</div>
</body>
</html>
