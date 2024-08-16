import numpy as np
from sys import argv
from time import time_ns

start = time_ns()

def intOrFloat(value):
    try:
        return int(value)
    except ValueError:
        return float(value)

n = int(argv[1])
el = intOrFloat(argv[2])

a = np.full((n, n), el)
b = a.copy()

inter = time_ns

c = a@b

end = time_ns()

print(inter-start, end-inter)
# print(start, inter, end)


