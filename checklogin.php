<?php
	require_once("class/LoginClass.php");

	// Check of de loginformulier velden wel zijn ingevuld
	if (!empty($_POST['email']) && !empty($_POST['password']))
	{
		/* Check in de database of beide ingevoerde waarden in
		 * het loginformulier wel bestaan in de login tabel
		 * Tussen de haakjes van het onderstaande if-statement
		 * moet true of false komen te staan. We schrijven daarvoor
		 * een method in de LoginClass class. 
		 * Een static method uit een class kan worden aangeroepen
		 * met: de naam van de class gevolgd door dan een
		 * dubbele dubbele punt gevold door de naam van de method.
		 */
		if (LoginClass::check_if_email_password_exists($_POST['email'],
													   $_POST['password']))
		{
			/* Vind de logingegevens van de user die inlogt. Je krijgt
			 * een loginClass object terug. En je kan dus de properties
			 * getLogin() en getUserrole() opvragen.		 * 
			 */	
			$user = LoginClass::find_login_user($_POST['email'],
												$_POST['password']);
			
			$_SESSION['id']			= $user->getLogin_id();
			$_SESSION['userrole']	= $user->getUserrole();
						
			switch ($_SESSION['userrole'])
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