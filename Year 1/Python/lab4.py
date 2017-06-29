import sys
def timething(time1, time2):
	hrs1 = time1 // 100 #dividing the input "0000-2359" so that the decimal place moves up two oto "00.00-23.59"
	hrs2 = time2 // 100 #same as the first one but for the other hour value
	min1 = time1 % 100 #the remainder of the input "0000-2359", which is ".00 or .59"
	min2 = time2 % 100 #the remainder of the second input "0000-2359", which is ".00 or .59"
	if hrs2 < hrs1: #if the hour input value of time 2 is greater than the input value of time 1
		hrs2 += 24 #add it by 24 hours so they are on the same level/scale to subtract the difference
	hrsdiff = hrs2 - hrs1 #calculate the hours difference now that they are on same level. 
	if min2 < min1: #if the input value for minutes in time 2 is greater than the input value for minutes in time 1
		min2 += 60 #add the minutes value to 60 to be on the same level
		hrsdiff -= 1 #minus the hours by one to make sure it isn't adding two hours
	mindiff = min2 - min1 #subtract the two minutes values
	if mindiff < 10: #if the minutes is less than 10
		return str(hrsdiff) + ":0" + str(mindiff) #zero pad the minutes value to be "0 and mindiff"
	else: 
		return str(hrsdiff) + ":" + str(mindiff) #add a string in between hrsdiff and mindiff
		
def getDivisors(n):
	for x in range (2,n): #x is every number within 2 and the input value
		if n % x == 0: #if the input value divided by x is even
			return False #return that it isn't a prime number
	else: #otherwise
		return True #return that it is a prime number
		
def getThings(n):
	sum = 0 #to keep track of sum/make bigger
	i = 1 #starting point to test divisors
	while i < n: #if the divisor isn't equal or greater than next
		if n % i == 0: #if it's a proper divisor
			sum = sum + i #add the sum variable to the list to test below
		i += 1 #increment the divisor by 1
	if n < sum: #if the input value is less than the sum
		return "abundant" #return the string called abundant
	elif n == sum: #if the input value is equal to the sum
		return "perfect" #return the string called perfect
	elif n > sum: #if the input value is greater than the sum
		return "deficient" #return the string called deficient
	
	
if __name__ == "__main__":

	question = sys.argv[1]

	if question == "q1":
		time1 = int(input())
		time2 = int(input())
		print (timething(time1, time2)) 

	elif question == "q2":
		n = int(input())
		print (getDivisors(n))
		
	elif question == "q3":
		n = int(input())
		print (getThings(n))

























