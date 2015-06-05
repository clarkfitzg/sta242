# Get all the imports with this
from loadtaxi import *


start = time()

alpha = 0.06
x = taxi['trip_time_in_secs'] / 60
y = taxi['total_amount']
plt.scatter(x, y, alpha=alpha)
plt.xlabel('trip time in minutes')
plt.ylabel('total fare amount in dollars')
plt.savefig('alpha.png')

mtimer(start, filename=__file__)
