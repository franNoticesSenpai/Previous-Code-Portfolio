import sys
def fib(n):
	fib1 = 1
	fib2 = 1
	i = 3
	if n <=2:
		return 1
	else:
		while i <= n:
			current = fib1 + fib2
			i = i + 1
			fib1 = fib2
			fib2 = current
	return current

def merge(L1,L2):
	currentL1 = 0
	currentL2 = 0
	L3 = []
	while currentL1 < len(L1) and currentL2 < len(L2):
		if  L1[currentL1] <= L2[currentL2]: #adding to L3
			L3.append(L1[currentL1])
			currentL1 += 1

		else:
			L3.append(L2[currentL2])
			currentL2 += 1
	L3+= L1[currentL1:]
	L3+= L2[currentL2:]

	return L3

def leftTriangle(n):
	for i in range(1, n+1):
		for k in range (1, i+1):
			print ("*", end="")
		print ("")

def leftTriangle2(n):
	if n == 0: return
	leftTriangle2 (n-1)
	for k in range (1, n+1):
		print ("*", end="")
	print ("")

def rightTriangle(n):
	stars = 1
	number_spaces = n-1
	while n > 0:
		s = ""
		for y in range (0, number_spaces):
			s = s + " "
		for y in range (0, stars):
			s = s + "*"
		print (s)
		stars = stars + 1
		number_spaces = number_spaces - 1
		n = n - 1

def rightTriangle2(n,t):
	if n == 0: return
	rightTriangle2 (n-1, t+1)
	for i in range(1, t+1):
		print (" ", end="")
	for i in range (1, n+1):
		print ("*", end="")
	print ("")

def GCD (x,y):
	r = x % y
	while r != 0:
		x = y
		y = r
		r = x % y
	return y

def GCD2 (x,y):
	if 0 == x % y: return y
	else: 
		return GCD2 (y, x % y)
		
		








if __name__ == "__main__":

	question = sys.argv[1]

	if question == "q1":
		n = int(input())
		current = fib(n)
		print (current)

	elif question == "q2":
		L1 = list(map(int, input().split(",")))
		L2 = list(map(int, input().split(",")))
		print (merge(L1,L2))

	elif question == "q3":
		n = int(input())
		leftTriangle (n)

	elif question == "q4":
		n = int(input())
		leftTriangle2 (n)

	elif question == "q5":
		n = int(input())
		rightTriangle (n)

	elif question == "q6":
		n = int(input())
		t = 0
		rightTriangle2 (n,t)

	elif question == "q7":
		x = int(input())
		y = int(input())
		print (GCD (x,y))
		
	elif question == "q8":
		x = int(input())
		y = int(input())
		print (GCD2 (x,y))
