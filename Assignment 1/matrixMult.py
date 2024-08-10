from time import time_ns

start = time_ns()

n = int(input())

a = [[99]*n for _ in range(n)]
b = [[99]*n for _ in range(n)]
c = [[0]*n for _ in range(n)]

# a = [[99.99]*n for _ in range(n)]
# b = [[99.99]*n for _ in range(n)]
# c = [[0.0]*n for _ in range(n)]

for i in range(n):
        for j in range(n):
            for k in range(n):
                c[i][j] += a[i][k]*b[k][j]

end = time_ns()

print(end-start)
