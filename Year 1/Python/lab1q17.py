P = float (input())
R = float (input())
T = float (input())
R = R / 12
T = T * 12
U = (P * R * (1 + R)**T) / ((1 + R)**T - 1)
print("%.2f" % U )