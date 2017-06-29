<?php
//Sanitize all input
$action = htmlspecialchars(strip_tags(trim($_POST['action'])), ENT_QUOTES);
$name = htmlspecialchars(strip_tags(trim($_POST['name'])), ENT_QUOTES);
$breed = htmlspecialchars(strip_tags(trim($_POST['breed'])), ENT_QUOTES);
$height = htmlspecialchars(strip_tags(trim($_POST['height'])), ENT_QUOTES);
$weight = htmlspecialchars(strip_tags(trim($_POST['weight'])), ENT_QUOTES);
$age = htmlspecialchars(strip_tags(trim($_POST['age'])), ENT_QUOTES);

//Declare booleans for testing purposes later
$correctHeight;
$correctWeight;
$correctAge;

//Check for input
if (!empty($action) && !empty($name) && !empty($breed) && !empty($height) && !empty($weight) && !empty($age)){
		//Now input is ensured to not be empty, check for correct types
		$correctHeight = is_numeric($height);
		$correctWeight = is_numeric($weight);
		$correctAge = is_numeric($age);

		//If any one of these had bad input, let the user now
		if ($correctHeight == false || $correctWeight == false || $correctAge == false){
			echo 'An incorrect value was entered, please try again';
		}

		//Positive integer check
		else if($height < 0 || $weight < 0 || $age < 0){
			echo 'No negative numbers allowed for any of the following: age, weight or height';
		}

		//If the code got to this point, it is safe to call the function and build the array
		else{
			//Make the input array
			$inputArray = [
				"action" => $action,
				"name" => $name,
				"breed" => $breed,
				"height" => $height,
				"weight" => $weight,
				"age" => $age,
			];

			//Asumption is that the $vars used in the example will take an array
			addHorseToDatabase($inputArray);
		}

	}

//Any of the fields were blank
else{
	echo 'Ensure that you have entered all fields in';
}

?>