<?php
$logFileChoice = htmlspecialchars(strip_tags(trim($_POST['logFileChoice'])), ENT_QUOTES);

//Open log file from directory: /var/log/httpd/access_log*
$archive  = glob("/var/log/httpd/access_log*");
$index = $_POST["logFileChoice"];

//Store choice from HTML form and open file
$openingFile = $archive[$index];

// Open the file.
$logFile = fopen($openingFile, "r");

//Regular expressions to match the byte code, status code and IP address
$IP = "/^\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}/";
$byteCode = '/(?<= \d{3} )[\d-]+(?= )/';
$statusCode = '/(?<= )\d{3}(?= [\d-])/';


$list = array();

// Loop reading the file. feof($foo) will be false as long
// there are still more lines in the file
while (!feof($logFile))
{
    //Get contents of file and store matches into variables
    $input = fgets($logFile);
    preg_match($IP, $input, $IPArray);
    preg_match($byteCode, $input, $byteArray);
    preg_match($statusCode, $input, $statusArray);

    $ipFound;
    $statusFound;
    $byteFound;

    //Store set keys and values to array. Otherwise, set to null.
    if (isset($IPArray[0])) {
        $ipFound = $IPArray[0];
    } else {
        $ipFound = null;
    }
    if (isset($statusArray[0])) {
        $statusFound = $statusArray[0];
    } else {
        $statusFound = null;
    }
    if (isset($byteArray[0])) {
        $byteFound = $byteArray[0];
    } else {
        $byteFound = null;
    }
    //Check for status code in 200's
    if (substr ($statusFound,0,1) == '2') {
        //Check if a key hasn't been set. Add byte code to both cases.
        if (!isset($list[$ipFound])) {
            $list[$ipFound] = null;
            $list[$ipFound] += (int)$byteFound;
        } else {
            $list[$ipFound] += (int)$byteFound;
        }
    }
}
fclose($logFile);

//Display associative array
foreach ($list as $IP => $bytes)
{
    echo "<b>$IP</b>" , ":    =    ", "$bytes";
    echo "<br>";
}
?>