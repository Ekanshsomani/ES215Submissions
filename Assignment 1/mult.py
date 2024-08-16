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
# n = 256

a = [[el]*n for _ in range(n)]
b = [[el]*n for _ in range(n)]
c = [[0]*n for _ in range(n)]

start = time_ns()
for i in range(n):
        for j in range(n):
            for k in range(n):
                c[i][j] += a[i][k]*b[k][j]
end = time_ns()

print("meat:", (end-start)/1e9)