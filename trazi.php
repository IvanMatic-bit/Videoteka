<?php
    require "connection.php";
    require "./partials/head.php";
    $tempVar = $_POST["Trazi"];
    $sql= "SELECT *\n"

    . "FROM film\n"

    . "WHERE Naziv\n"

    . "LIKE '%$tempVar%'";
    $query = mysqli_query($db,$sql);
    $result = mysqli_fetch_all($query,MYSQLI_ASSOC);

foreach ($result as $row) {
    echo "<div class='col-lg-3 col-md-4 col-sm-1'><div class='card'><div class='card-body'> <h4 class='card-title'>".$row["Naziv"]."</h4><p class='card-text'>Reziser: ".$row["Reziser"]."</p><p class='card-text'>Duzina trajanja: ".$row["DuzinaTrajanja"]."</p><p class='card-text'>Datum izlaska: ".$row["DatumIzlaska"]."</p><button class='card-button btn btn-primary'>Iznajmi $".$row["CijenaIznamljivanja"]."</button><button class='btn btn-danger card-button'>Kupi $".$row["CijenaKupovine"]."</button><p class='card-text'>Rating: ".$row["Rating"]."</p><p class='card-text'>Box office: $".$row["BoxOffice"]."</p></div></div></div>";
}
   



?>