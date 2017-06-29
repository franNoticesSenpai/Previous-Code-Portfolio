import sys
def q1(target,d):
 #target = whatever the word is
	if target in d:
		return "The word \"" +str(target)+ "\" occurred " +str(d[target])+ " times in the text."#have loop stuff go here
	else:
	#have other loop stuff go here
	#you have to get the count (d[target])
	#print the result
		return "The word \"" +str(target)+ "\" did not occur in the text."
	
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
		if "a" in word or "A" in word: 
			aCount += 1
		if "e" in word or "E" in word: 
			eCount += 1
		if "i" in word or "I" in word:
			iCount += 1
		if "o" in word or "O" in word:
			oCount += 1
		if "u" in word or "U" in word:
			uCount += 1
		sum += len(word)
	f = open (target,"w")
	f.write("There are " +str(len(d))+ " unique words.\n") #for each result line... also don't forget the new lines 
	f.write("The word \""+str(maxWord)+"\" is the most used word (" +(str(maxCount))+" occurrences).\n")
	f.write("The unique words have an average length of {:.2f}.\n" .format(sum/len(d)))
	f.write("Vowel usage amongst the unique words:\n")
	f.write("\ta or A = " +str(aCount)+"\n")
	f.write("\te or E = " +str(eCount)+"\n")
	f.write("\ti or I = " +str(iCount)+"\n")
	f.write("\to or O = " +str(oCount)+"\n")
	f.write("\tu or U = " +str(uCount)+"\n")
	f.close()
		
		
		
		
if __name__ == "__main__": 
	d = {} #dictionary starts off empty
	c = 0 #counter thing
	fileThing = sys.argv[1]
	question = sys.argv[2]
	target = sys.argv[3]
	f = open (fileThing, "r")
	for line in f:
		words = line.split()
		for word in words:
			if word in d:
				d[word] += 1#have the loop stuff go here
			else:
				d[word] = 1#have other thing go here
		#thing that gets current count
		#set new current back into d
	f.close()

	if question == "q1":
		print(q1(target,d))
		
	elif question == "q2": 
		q2(target, d)