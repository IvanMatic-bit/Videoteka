<?php 
session_start();
require "connection.php";
$email = $_POST["email"];
$password = $_POST["password"];
$sql = "SELECT KorisnikID FROM korisnici WHERE Email='$email' AND Sifra ='$password'";
$query = mysqli_query($db,$sql);
$id=mysqli_fetch_assoc($query); 
if (isset($id)) {
	$_SESSION["id"]=$id;
	header("Location: index.php");
	
	
}else{
	header("Location: SecondPage.php");
}
?>