# Get all the imports with this
from loadtaxi import *


start = time()

x = taxi['total_amount'][taxi['total_amount'] <= 100]
x.hist()  # Pandas method
#plt.hist(x)  # Matplotlib
plt.tight_layout()
plt.savefig('histogram.png')

mtimer(start, filename=__file__)
