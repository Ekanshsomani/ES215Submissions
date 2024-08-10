import numpy as np
from time import time_ns

start = time_ns()


a = np.full((n, n), 99)
# a = np.full((n, n), 99.99)
b = a.copy()

c = a@b

end = time_ns()

print(end-start)


