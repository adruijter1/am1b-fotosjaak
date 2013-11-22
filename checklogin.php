<?php
	if (!empty($_POST['email']) && !empty($_POST['password']))
	{
		//Check in de database of beide ingevoerde waarden bestaan
		include("connect_db.php");
		$query = "SELECT *
				  FROM `users`
				  WHERE `email` = '".$_POST['email']."'
				  AND	`password` = '".$_POST['password']."'";
		$result = mysql_query($query, $db);
		
		if (mysql_num_rows($result) > 0)
		{
			$record = mysql_fetch_array($result);
			$_SESSION['id'] = $record['id'];
			$_SESSION['userrole'] = $record['userrole'];
						
			switch ($record['userrole'])
			{
				case 'customer':
					header("location:index.php?content=customer_homepage");
					break;
				case 'admin':
					header("location:index.php?content=admin_homepage");
					break;
				case 'root':
					header("location:index.php?content=root_homepage");
					break;			
			}		
		}
		else
		{
			echo "Gebruikersnaam en/of wachtwoord niet bekent";
			header("refresh:4; url=index.php?content=login");
		}
	}
	else
	{
		//Stuur door naar login met foutmelding
		echo "U heeft een of meerdere velden niet ingevuld";
		header("refresh:4; url=index.php?content=login");
	}


?>