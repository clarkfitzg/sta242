'''
Load the sampled taxi data
'''

import os
from time import time
from functools import partial

#import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def timer(start, filename, program):
    '''
    Print out timing data
    '''
    diff = str(time() - start)
    # Remove file extension
    plot = filename.split('.')[0]
    print(','.join((diff, plot, program)))


mtimer = partial(timer, program='matplotlib')

filename = os.sep.join((os.pardir, 'data', 'taxi.csv'))

taxi = pd.read_csv(filename)

#plt.style.use('ggplot')
