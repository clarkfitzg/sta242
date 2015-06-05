'''
Makes all the plots and does the timings
'''

import os
from time import time
from functools import partial

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


taxicsv = os.sep.join(('data', 'taxi.csv'))
taxi = pd.read_csv(taxicsv)


def timer(plotfunc):
    '''
    Print out timing data for plotfunc
    '''

    # Time the function call
    start = time()
    plotfunc.__call__()
    diff = str(time() - start)

    # Infer plot type from name
    plottype = plotfunc.__name__.split('_')[1]

    print(','.join((diff, plottype, 'matplotlib')))


def plot_sample():
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


def plot_histogram():
    x = taxi['total_amount'][taxi['total_amount'] <= 100]
    x.hist()  # Pandas method
    #plt.hist(x)  # Matplotlib
    plt.tight_layout()
    plt.savefig('histogram.png')


def plot_boxplot():
    subset = taxi['total_amount'] <= 100
    taxi[subset].boxplot('total_amount', by='payment_type')
    plt.tight_layout()
    plt.savefig('boxplot.png')


def plot_alpha2():
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


def plot_alpha():
    alpha = 0.06
    x = taxi['trip_time_in_secs'] / 60
    y = taxi['total_amount']
    plt.scatter(x, y, alpha=alpha)
    plt.xlabel('trip time in minutes')
    plt.ylabel('total fare amount in dollars')
    plt.tight_layout()
    plt.savefig('alpha.png')


if __name__ == '__main__':

    #plt.style.use('ggplot')

    # Sets default figure size
    plt.figure(figsize=(4, 4))

    g = globals()
    plotfuncs = [g[key] for key in g if key.startswith('plot_')]

    for f in plotfuncs:
        timer(f)
