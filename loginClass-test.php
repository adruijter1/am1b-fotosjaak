<h3>Dit is de LoginClass-test pagina</h3><hr>
<?php
	//Voeg het bestand LoginClass.php in
	require_once("class/LoginClass.php");
	
	$login = new LoginClass();
	
	$query = "SELECT * FROM `login`";
	
	$result = $login->find_by_sql($query);
	
	//var_dump($result);
	
	foreach ($result as $value)
	{
		echo $value->login_id."<br>";		
	}
?>