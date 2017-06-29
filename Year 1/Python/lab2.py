import sys, math
def celcius2fahrenheit(celcius):
	fahrenheit = (9 * celcius / 5) + 32
	return fahrenheit

def fahrenheit2celcius(fahrenheit):
	celcius = (fahrenheit - 32) * 5/9
	return celcius

def sides2area(sides):
	area = sides * sides
	return area

def lengthandwidth2area(length,width):
	area = length * width
	return area

def baseheight2area(Base,Height):
	area = 1/2 * Base * Height
	return area

def sideside2hypotenuse (Side1,Side2):
    Hypotenuse = Side1**2 + Side2**2
    Hypotenuse = math.sqrt(Hypotenuse)
    return Hypotenuse

def radius2circumference (radius):
    circumference = 2 * math.pi * radius
    return circumference

def radius2area (radius):
    Area = math.pi * radius * radius
    return Area

def numberatordenominator2decimal (numberator,denominator):
    decimal = (numberator) / (denominator)
    return decimal

def abc2average (a,b,c):
    Answer = (a + b + c)/3
    return Answer

def sumproduct2integers (NNI, PI):
    S = NNI + PI
    P = NNI * PI
    Q = NNI % PI
    return S,P,Q

def fuelperkm (STARTKM, ENDKM, STARTFA, ENDFA):
    A =(STARTFA - ENDFA)
    B = (ENDKM - STARTKM)
    F = A / B
    return F

def cad2usd (CAD):
    USD = CAD / 1.12
    return USD

def hw2bmi (H,W):
    BMI = W / H**2
    return BMI

def hb2hsb (L):
    H = 1.34 * L**0.5
    return H

def gasconsumption (STG, ENG, DAY):
    E = (ENG - STG)
    E = E * 1.433
    E = E + (9.02 * DAY)
    E = (E * 0.05) + E
    E = E / 100
    return E

def morgage2monthlypayment (P,R,T):
    R = R / 12
    T = T * 12
    U = (P * R * (1 + R)**T) / ((1 + R)**T - 1)
    return U

question = sys.argv[1]

if question == "q1":
	value = float(input())
	fahrenheit = celcius2fahrenheit(value)
	print (fahrenheit)

elif question == "q2":
	value = float(input())
	celcius = fahrenheit2celcius(value)
	print (celcius)

elif question == "q3":
	value = float(input())
	area = sides2area(value)
	print (area)

elif question == "q4":
	value = float(input())
	value2 = float(input())
	area = lengthandwidth2area(value,value2)
	print (area)

elif question == "q5":
	value = float(input())
	value2 = float(input())
	area = baseheight2area(value,value2)
	print (area)

elif question == "q6":
    value = float(input())
    value2 = float (input())
    Hypotenuse = sideside2hypotenuse(value,value2)
    print (Hypotenuse)

elif question == "q7":
    value = float(input())
    circumference = radius2circumference(value)
    print (circumference)

elif question == "q8":
    value = float(input())
    Area = radius2area(value)
    print (Area)

elif question == "q9":
    value = float (input())
    value2 = float (input())
    decimal = numberatordenominator2decimal (value,value2)
    print(decimal)

elif question == "q10":
    a = float (input())
    b = float (input())
    c = float (input())
    Answer = abc2average (a,b,c)
    print (Answer)

elif question == "q11":
    NNI = int(input())
    PI = int(input())
    S,P,Q = sumproduct2integers (NNI, PI)
    print (S)
    print (P)
    print (Q)

elif question == "q12":
    STARTKM = float(input())
    ENDKM = float(input())
    STARTFA = float(input())
    ENDFA = float(input())
    F = fuelperkm (STARTKM, ENDKM, STARTFA, ENDFA)
    print (F)

elif question == "q13":
    value = float(input())
    USD = cad2usd (value)
    print("%.2f" %USD)

elif question == "q14":
    value = float(input())
    value2 = float(input())
    BMI = hw2bmi (value,value2)
    print("%.1f" % BMI)

elif question == "q15":
    value = float(input())
    H = hb2hsb (value)
    print (H)

elif question == "q16":
    value = float(input())
    value2 = float(input())
    value3 = float (input())
    E = gasconsumption (value, value2, value3)
    print("%.2f" % E)

elif question == "q17":
    value = float(input())
    value2 = float(input())
    value3 = float(input())
    U = morgage2monthlypayment (value, value2, value3)
    print("%.2f" % U )


