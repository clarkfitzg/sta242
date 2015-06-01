'''
Simulate the data used for the benchmarks and write it to the local
directory
'''

import numpy as np


np.random.seed(242)
n = int(1e6)

x = np.random.randn(n)

# Satisfies linear model
y = x + np.random.randn(n)

xy = np.column_stack((x, y))

np.savetxt('normal.txt', xy)
