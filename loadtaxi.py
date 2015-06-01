'''
Load the sampled taxi data
'''

import os

import pandas as pd


filename = os.sep.join(('data', 'taxi.csv'))

taxi = pd.read_csv(filename)
