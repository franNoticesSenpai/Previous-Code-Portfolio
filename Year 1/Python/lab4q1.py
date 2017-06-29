import sys
hrs1 = time1 // 100
hrs2 = time2 // 100
min1 = time1 % 100
min2 = time2 % 100
if hr2 < hrs1:
	hr2 += 24
hrsdiff = hrs2 - hrs1
if min2 < min1:
	min2 + 60
	hrsdiff -= 1
mindiff = min2 - min1
if mindiff < 10:
	return str(hrsdiff) + ":0" + str(mindiff)
else: 
	return str(hrsdiff) + ":" + str(mindiff)
	


	
	
	
	
	
	
	
	
	
	