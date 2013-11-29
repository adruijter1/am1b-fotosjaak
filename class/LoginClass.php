<?php
	require_once('MySqlDatabaseClass.php');
	
	//Dit is de class-definitie van de LoginClass
	class LoginClass
	{
		//Fields
		private $login_id;
		private $email;
		private $password;
		private $userrole;
		private $isactivated;
		private $registerdate;
		
		// De constructor van de LoginClass
		public function __constructor()
		{
						
		}
		
		// Method find_by_sql
		public function find_by_sql($sql)
		{
			// global zorgt ervoor dat $database ook binnen de haakjes
			// van de find_by_sql method bekent is.	
			global $database;
			
			//Roep de fire_query method aan met het $database object
			$result = $database->fire_query($sql);
			
			// Hier wordt een array gedefinieerd. Dit array gaat
			// LoginClass-objecten bevatten.
			$object_array = array();
			
			// Met deze while-lus vullen we het $object-array met LoginClass-objecten
			while ($row = mysql_fetch_array($result))
			{
				//Maak een nieuw LoginClass-object aan per while ronde	
				$object = LoginClass();
				
				//Vul de velden van het LoginClass-object met de gevonden record-
				//waarden uit de tabel
				$this->login_id	= $row['login_id'];
				$this->email	= $row['email'];
				$this->password	= $row['password'];
				$this->userrole = $row['userrole'];
				$this->isactivated	= $row['isactivated'];
				$this->registerdate	= $row['registerdate'];
				
				
			}
			
			
		}
		
	}


?>
Dit is de loginclasspagina