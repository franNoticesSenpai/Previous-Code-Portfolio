STG = float(input())
ENG = float(input())
DAY = float(input())
E = (ENG - STG)
E = E * 1.433
E = E + (9.02 * DAY)
E = (E * 0.05) + E 
E = E / 100
print("%.2f" % E)