<?php
// define variables
 	$gamestate = "";
       $command = $_POST["Command"];
       $gameid = $_POST["GameID"];
       $stateid = $_POST["StateID"];
// I think the model should be stored in a separate file like this
//  include_once("model/Model.php");
//  but I wasn't sure if this was what you wanted so I included the code 
//  in this page

//  shouldn't the controller be in a separate file as well and just include it??

// define the controller
class Controller {
     public $model;
 
     public function __construct()  
     {  
          $this->model = new Model();
     } 
 
     public function invoke()
     {
// call the getcommandresult() function of model class and store the
// return value of this function into the reslt variable.

       $gamestate = $this->model->getcommandresult($command,$gameid,$stateid);
// display the view
 
     }
 }
// define the model

class Model {

 	public function getcommandresult($comm, $game, $state)
 	{
  // code goes here to take the command entered and determine the result
		return "game state returned from database";
  	}
 }

// now define the view
?>

<html>
    <head></head>

    <body>
      <?php echo $gamestate; ?>
      <h2>Main Game Page</h2>
      <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST">
      <p>
         <input type="hidden" name="gameid" value="<?php echo $gameID; ?>" />
         <br><br>
         <input type="hidden" name="stateid" value="<?php echo $stateID; ?>" />
         <br><br>
         Command: <input type="text" name="command" value="<?php echo $command;?>" />
      </p>

      <p>
         <input type="submit" value="Enter" name="submit" </button> 
      </p>
      </form>

   </body>
</html>







