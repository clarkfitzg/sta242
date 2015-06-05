# Get all the imports with this
from loadtaxi import *


start = time()

subset = taxi['total_amount'] <= 100
taxi[subset].boxplot('total_amount', by='payment_type')
plt.tight_layout()
plt.savefig('boxplot.png')

mtimer(start, filename=__file__)
