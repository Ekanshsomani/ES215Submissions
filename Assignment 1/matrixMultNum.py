import numpy as np
from sys import argv
from time import time_ns

def intOrFloat(value):
    try:
        return int(value)
    except ValueError:
        return float(value)

n = argv[1]
el = intOrFloat(argv[2])

start = time_ns()
a = np.full((n, n), el)
# a = np.full((n, n), 99.99)
b = a.copy()

c = a@b
end = time_ns()

print((end-start)/1e9)


