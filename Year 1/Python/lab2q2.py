def fahrenheit2celcius(fahr):
	celcius = (fahrenheit - 32) * 5/9
	return celcius

question = sys.argv[2]
if question == "q2":
	value = float(input())
	celcius = fahrenheit2celcius(value)
	print (celcius)