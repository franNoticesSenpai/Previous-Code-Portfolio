<?php 
/* http://codular.com/php-gd-introduction */
/* Build a square of supplied colour. */

// Call the function creating a square of 110 pixels with colour of green.
$size1 = $_GET['size1']; 
$red = $_GET['red'];
$blue = $_GET['blue'];
$green = $_GET['green'];

square($size1, $red, $green, $blue);

// Define the function that builds the square. The parameters are size in pixels and the red, green, blue colour intensity.

function square ($size, $r, $g, $b) {
// Output the header telling the browser this is a png image.
header ('Content-type: image/png');

// create the empty image.
$im = imagecreatetruecolor($size, $size) or die('Cannot Initialize new GD image stream');

/* Define the foreground and background colours and fill the image with the bacground colour.
The foreground colour is passed as a parameter, the background colour is white */
$fgcolor = imagecolorallocate($im, $r, $g, $b);
$bgcolor = imagecolorallocate($im, 255,255,255);
imagefill($im, 0, 0, $bgcolor); 

// Draw a rectangle. The upper left coordinate is 0,0. The lower right is size-1, size-1 since we started counting at 0. 
imagerectangle($im, 0, 0, $size-1, $size-1, $fgcolor);

/* Write the image to standard out - in the case of the web server to the network to the browser
and free up any memory used by the image */
imagepng($im);
imagedestroy($im);
}



















?>