<?php
 require_once("class/LoginClass.php");

 if (LoginClass::check_if_email_password_exists($_GET['email'],
 												$_GET['password']))
 {
?>
	<p>Welkom op de site uw account wordt geactiveerd nadat<br>
	   U een nieuw wachtwoord heeft gekozen.
	</p>
	<br>  
	<form action='' method='post'>
		<table>
			<tr>
				<td>nieuw wachtwoord (12 tekens)</td>
				<td>
					<input type='password'
						   name='password'
						   size='12'
						   maxlength='12' />
				</td>
			</tr>
			<tr>
				<td>nieuw wachtwoord (check)</td>
				<td><input type='password'
						   name='password_check'
						   size='12'
						   maxlength='12' /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type='submit' 
						   name='submit'
						   value='verstuur' /></td>
			</tr>
		</table>
	</form>

<?php
 }
 else 
 {
    echo "U heeft geen rechten op deze pagina. U wordt<br> 
    	  doorgestuurd naar de homepage";
    header("refresh:5;index.php?content=homepage");
 }
?>
