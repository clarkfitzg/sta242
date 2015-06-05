'''
Load the sampled taxi data
'''

import os
from time import time
from functools import partial

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def timer(start, filename, program):
    '''
    Print out timing data
    '''
    diff = str(time() - start)

    # Remove directory prefix
    plot = os.path.basename(filename)
    # Remove file extension
    plot = plot.split('.')[0]

    print(','.join((diff, plot, program)))


mtimer = partial(timer, program='matplotlib')

taxicsv = os.sep.join(('data', 'taxi.csv'))

# Make runs this from the top level directory
#taxicsv = os.sep.join((os.pardir, 'data', 'taxi.csv'))

taxi = pd.read_csv(taxicsv)

# Remainder of script should run from matplotlib directory
os.chdir('matplotlib')

#plt.style.use('ggplot')

plt.figure(figsize=(4, 4))
