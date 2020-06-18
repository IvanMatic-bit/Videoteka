<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container-fluid bg-dark d-flex flex-row-reverse p-2">
        <a class="btn btn-danger mx-3" href="logout.php">Odjavi se</a>
        <form class="form-inline"  action="trazi.php" method="get">
            
            <input class="form-control" index="Trazi" type="text" placeholder="..." name="Trazi" id="Trazi">
            <button type="submit" class="form-control mx-1">Trazi</button>
        </form>
        
    </div>
    <ul class="nav nav-tabs bg-dark " id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link " id="home-tab" data-toggle="tab" href="#filmovi" role="tab" aria-controls="filmovi"
                aria-selected="true">Filmovi</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#serije" role="tab" aria-controls="serije"
                aria-selected="false">Serije</a>
        </li>
       
    </ul>
    <div class="tab-content" id="myTabContent">

        <div id="filmovi" class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="row">
        <?php require 'PrikaziFilmove.php' ?>
               
            </div>
        </div>
        <div class="tab-pane fade"  role="tabpanel" aria-labelledby="profile-tab" id="serije">
            <div class="row">

            <?php require 'PrikaziSerije.php'; ?>

            </div>
        </div>
    </div>




</body>

</html>

