<?php
session_start();
include "db.php";

// Redirect if user is not logged in
if (!isset($_SESSION['user_id'])) {
    die("Please <a href='login.php'>login</a> to book.");
}

$user_id = $_SESSION['user_id'];
$user_name = $_SESSION['name'];

$show_id = $_GET['show_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['seats'])) {
    foreach ($_POST['seats'] as $seat_id) {
        // Mark seat as booked
        $conn->query("UPDATE seats SET is_booked = 1 WHERE seat_id = $seat_id");
        // Add to bookings table
        $conn->query("INSERT INTO bookings (user_id, show_id, seat_id) VALUES ($user_id, $show_id, $seat_id)");
    }

    echo "<p class='success'>✅ Booking successful!</p>";
    echo "<p><strong>User:</strong> $user_name (User ID: $user_id)</p>";
    echo "<p><strong>Show ID:</strong> $show_id</p>";
    echo "<p><strong>Seats Booked:</strong> " . implode(", ", $_POST['seats']) . "</p>";
}

$result = $conn->query("SELECT * FROM seats WHERE show_id = $show_id");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Choose Seats</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Select Your Seats</h2>
<form method="POST">
<div class="seats-container">
<?php while ($row = $result->fetch_assoc()) {
    $disabled = $row['is_booked'] ? 'disabled' : '';
    echo "<label><input type='checkbox' name='seats[]' value='{$row['seat_id']}' $disabled> {$row['seat_number']}</label>";
} ?>
</div>
<input type="submit" value="Book Now">
</form>
</body>
</html>
