<?php
include "db.php";
$movie_id = $_GET['movie_id'];
$result = $conn->query("SELECT shows.*, theaters.name as theater_name FROM shows JOIN theaters ON shows.theater_id = theaters.theater_id WHERE movie_id = $movie_id");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Showtimes</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Available Showtimes</h1>
<ul>
    <?php while ($row = $result->fetch_assoc()) { ?>
        <li>
            <?= $row['theater_name'] ?> - <?= $row['show_time'] ?>
            <a href="seats.php?show_id=<?= $row['show_id'] ?>">Book Seats</a>
        </li>
    <?php } ?>
</ul>
</body>
</html>
