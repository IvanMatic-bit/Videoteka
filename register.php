<?php 
require "connection.php";
$name = $_POST["name"];
$email = $_POST["email"];
$password = $_POST["password"];

$sql = "INSERT INTO korisnici (Ime, Email, Sifra, UserAdmin) VALUES
 ('$name','$email','$password', 1)";
$query= mysqli_query($db, $sql);
header("Location:login.view.php");

?>