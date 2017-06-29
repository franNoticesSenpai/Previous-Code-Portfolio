import sys, math

def celcius2fahrenheit(celcius):
	fahrenheit = (9 * celcius / 5) + 32
	return fahrenheit

question = sys.argv[1]
if question == "q1":
	value = float(input())
	fahrenheit = celcius2fahrenheit(value)
	print (fahrenheit) 
	
	