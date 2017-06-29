<?php

class Square 
{
	// initiallize variables needed
	var $size_canvas;
	var $size;
	var $red;
	var $green;
	var $blue;
	var $X;
	var $Y;
	
	// define the main creator
	function Square($size_canvas, $size, $X, $Y)
	{

		$this->canvas_size = $size_canvas;
		$this->object_size = $size;
		$this->X_displacement = $X;
		$this->Y_displacement = $Y;
		$this->Y_offset = $size_canvas - $Y;


		//create blank canvas for working in
		$this->image = imagecreatetruecolor($this->canvas_size, $this->canvas_size);
		$this->backing = imagecolorallocate($this->image, 255, 255, 255);
		imagefill($this->image,0,0,$this->backing);
	}

	// create the coloured object and put it in the picture
	function add_to_canvas($red,$green,$blue)
	{
		$this->Y_offset = $this->Y_displacement-$this->canvas_size; #compensate for Y

		$this->frontage = imagecolorallocate($this->image, $red, $green, $blue);
		imagerectangle($this->image, $this->X_displacement, $this->Y_offset, $this->X_displacement+$this->object_size, $this->Y_offset-$this->object_size, $this->frontage);
	} 

	// convert to png 
	function show_yourself()
	{
		header('Content-type: image/png');
		imagepng($this->image);
	}

	//create increase size method
	function growplusplus($changing)
	{
		$this->object_size = $this->object_size + $changing;
	}

	//create decrease size method
	function growsmaller($changing)
	{
		$this->object_size = $this->object_size - $changing;
		if ($this->object_size <0){
			$this->object_size = 0;
		}
	}

	//create movement methods and check them for off canvas values
	function move_left($move)
	{
		$this->X_displacement = $this->X_displacement - $move;
		if ($this->X_displacement < 0){
			$this->X_displacement = 0;
		}elseif ($this->X_displacement > $this->canvas_size){
			$this->X_displacement = 0;
		}
	}

	function move_right($move)
	{
		$this->X_displacement = $this->X_displacement + $move;
		if ($this->X_displacement < 0){
			$this->X_displacement = 0;
		}elseif ($this->X_displacement > $this->canvas_size){
			$this->X_displacement = 0;
		}
	}

	function move_up($move)
	{
		$this->Y_displacement = $this->Y_displacement + $move;
		if ($this->Y_displacement < 0){
			$this->Y_displacement = 0;
		}elseif ($this->Y_displacement > $this->canvas_size){
			$this->Y_displacement = 0;
		}
	}

	function move_down($move)
	{
		$this->Y_displacement = $this->Y_displacement - $move;
		if ($this->Y_displacement > 0){
			$this->Y_displacement = 0;
		}elseif ($this->Y_displacement > $this->canvas_size){
			$this->Y_displacement = 0;
		}
	}

	// crush, kill, destroy!
	function selfdestruct()
		{
			imagedestroy($this->image);
		}
}

$bravo = new Square (600,120,150,200);
$bravo->add_to_canvas(0,0,0);
$bravo->move_up(150);
$bravo->growplusplus(120);
$bravo->move_right(100);
$bravo->add_to_canvas(255,0,150);
$bravo->show_yourself();
$bravo->selfdestruct();

?>