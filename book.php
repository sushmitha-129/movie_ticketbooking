<?php
include "db.php";  // Include the database connection file

// Assuming you are passing the necessary variables via GET or POST
$user_id = 1;  // Example user ID
$show_id = 1;  // Example show ID
$seat_id = 1;  // Example seat ID

$sql = "INSERT INTO bookings (user_id, show_id, seat_id) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iii", $user_id, $show_id, $seat_id);

if ($stmt->execute()) {
    echo "Booking successful!";
} else {
    echo "Error: " . $stmt->error;
}
?>
