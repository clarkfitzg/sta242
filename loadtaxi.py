'''
Load the sampled taxi data
'''

import os

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


filename = os.sep.join(('data', 'taxi.csv'))

taxi = pd.read_csv(filename)

plt.style.use('ggplot')
