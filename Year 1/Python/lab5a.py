import.sys
def q1(target):
 #target = whatever the word is
	if target in d:
		print "The word:" +str(target)+ "occurred:" +str(d[target])+ "times in the text."#have loop stuff go here
	else:
	#have other loop stuff go here
	#you have to get the count (d[target])
	#print the result
		print "The word:" +str(target)+ "did not occur in the text."
	
def q2(target,d):
	aCount = 0
	eCount = 0
	iCount = 0
	oCount = 0
	uCount = 0
	maxCount = 0
	sum = 0
	maxWord = ""
	maxCount = 0
	for word in d:
		if d[word] > maxCount:
			maxWord = word
			maxCount = d[word]
		elif d[word] == maxCount:
			if word < maxWord:
			maxWord = word
			maxCount = d[maxWord]
		if "a" or "A" in word: 
			aCount += 1
		if "e" or "E" in word: 
			eCount += 1
		if "i" or "I" in word:
			iCount += 1
		if "o" or "O" in word:
			oCount += 1
		if "u" or "U" in word:
			uCount += 1
		sum += len(word)
f = open (sys.argv[1],"w")
f.write("There are:" +str(len(d))+ "unique words \n" #for each result line... also don't forget the new lines 
		"The word" +str(maxWord)+ "is the most frequent word" +(str(maxCount))+"occurrences. \n"
		"The unique words has an average length of" sum(len(word) for keys in d)/len(words)+
		"Vowel count in the dictionary:\n"
			"\ta or A:" +str(aCount)+"\n"
			"\te or E:" +str(eCount)+"\n"
			"\ti or I:" +str(iCount)+"\n"
			"\to or O:" +str(oCount)+"\n"
			"\tu or U:" +str(uCount)+"\n")
f.close()
		
		
		
		
if __name__ == +__"main"__: 
	d = {} #dictionary starts off empty
	f = open ("big.txt", "r") 
	c = counter #counter thing
	fileThing = sys.argv[1]
	question = sys.argv[2]
	target = sys.argv[3]
	f = open ("big.txt", "r")
	for line in f:
		words = line.split()
		for word in words:
			if word in d:
				d[c] += 1#have the loop stuff go here
			else:
				d[word] = 1#have other thing go here
		#thing that gets current count
		#set new current back into d
f.close()

if question == "q1":
	print(q1(target))
	
elif question == "q2": 
	q2(d,target)