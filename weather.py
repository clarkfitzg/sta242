'''
Attempt to load HDF5 climate data
'''

import pandas as pd

weather = pd.HDFStore('data/1A.GPM.GMI.COUNT2014v3.20150427-S122811-E140041.006595.V03B.HDF5', 'r')

weather = pd.read_hdf('data/1A.GPM.GMI.COUNT2014v3.20150427-S122811-E140041.006595.V03B.HDF5')
