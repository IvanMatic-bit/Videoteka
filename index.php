

<div class="container">
	<div class="row">
		<div class="col-6 offset-3">
		<?php
				if (isset($_SESSION["id"])) {
					echo "<h1>Welcome to our App</h1>";
					require 'SecondPage.php';
					
				}else{
					
					require 'FirstPage.php';
				}

			?>
		</div>
	</div>
</div>



