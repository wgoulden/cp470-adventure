<!DOCTYPE HTML> 
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body> 

<?php

// define variables


$gamestate = ""; // this value will be result of parsing the user command
$command = $_POST["Command"];
$gameid = $_POST["GameID"];
$stateid = $_POST["StateID"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {

     $command = test_input($_POST["Command"]);
     // check if command only contains letters, numbers  and whitespace
     if (!preg_match("/^[a-zA-Z ]*$/",$command)) {
       $command = "Only letters, numbers and white space allowed"; 
     }
     else
     {
	// process the command entered by the user
        // parse the command to get the user action
        
        //   display the result in the gamestate
      }

}
// catch any hacker input
function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
}


?>

<h2>Main Game Page</h2>
 
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"> 
   Game State: <input type="text" readonly name="gamestate" value="<?php echo $gamestate; ?>" />
   <input type="hidden" name="gameid" value="<?php echo $gameID; ?>" />
 <br><br>
   <input type="hidden" name="stateid" value="<?php echo $stateID; ?>" />
<br><br>

   Command: <input type="text" name="command" value="<?php echo $command;?>" />
   
   <br><br>
   

   <input type="submit" name="submit" value="Submit"> 
</form>

<?php
echo "<h2>Result of the command</h2>";
echo "user command was parsed and action was completed";


?>

</body>
</html>
