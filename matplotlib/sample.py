# Get all the imports with this
from loadtaxi import *


def plot_sample():
    start = time()

    npoints = 300
    x = taxi['trip_time_in_secs'] / 60
    y = taxi['total_amount']

    np.random.seed(2015)
    subset = np.random.choice(x.index, size=npoints, replace=False)

    plt.scatter(x[subset], y[subset])

    plt.xlabel('trip time in minutes')
    plt.ylabel('total fare amount in dollars')
    plt.tight_layout()
    plt.savefig('sample.png')

    mtimer(start, filename=__file__)
