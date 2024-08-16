import numpy as np
from sys import argv
from time import time_ns

startTime = time_ns()

def intOrFloat(value):
    try:
        return int(value)
    except ValueError:
        return float(value)

n = int(argv[1])
el = intOrFloat(argv[2])

a = np.full((n, n), el)
b = a.copy()

startTime = time_ns()
c = a@b
completionTime = time_ns()

print("meat:", (completionTime - startTime)/1e9)


