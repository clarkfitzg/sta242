# Get all the imports with this
from loadtaxi import *


start = time()

x = taxi['total_amount'][taxi['total_amount'] <= 100]
plt.hist(x)
plt.savefig('histogram.pdf')

mtimer(start, filename=__file__)
