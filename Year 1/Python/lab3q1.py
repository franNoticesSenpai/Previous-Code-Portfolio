import sys
# def fib(n):
	# fib1 = 1
	# fib2 = 1
	# i = 3
	# if n <=2:
		# return 1
	# else:
		# while i <= n:
			# current = fib1 + fib2
			# i = i + 1
			# fib1 = fib2
			# fib2 = current
	# return current

def merge(L1,L2):
	currentL1 = 0
	currentL2 = 0
	L3 = []
        while currentL1 < len(L) and currentL2 < len(L)
			if  L1[currentL1] <= L2[currentL2]: #adding to L3
				L3.append(L1[currentL1]) 
				[currentL1] += 1 
			
			elif  L2[currentL2] <= L1[currentL1]: #adding to L3
				list.append(L2[currentL2]) 
				[currentL2] += 1
		L3+= L1[currentL1:]
		L3+= L2[currentL2:]		
		    
	return L3



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





