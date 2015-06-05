# Get all the imports with this
from loadtaxi import *


start = time()

alpha = 0.02
x = taxi['trip_time_in_secs'] / 60
y = taxi['total_amount']

# Look at trip time less than an hour, total fare less than 100
subset = np.logical_and(x <= 60, y <= 100)

plt.scatter(x[subset], y[subset], alpha=alpha)

plt.xlabel('trip time in minutes')
plt.ylabel('total fare amount in dollars')
plt.tight_layout()
plt.savefig('alpha2.png')

mtimer(start, filename=__file__)
