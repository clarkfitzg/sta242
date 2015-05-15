'''
Attempt to load HDF5 climate data - 103 MB HDF format
'''

import pandas as pd
import tables

# long string
fname = ('data/1A.GPM.GMI.COUNT2014v3.20150427-S122811-E140041.'
        '006595.V03B.HDF5')

# Open HDF file in read mode
weather_pd = pd.HDFStore(fname, 'r')

# tables version easier for preliminary exploration than pandas
w = tables.open_file(fname, 'r')

r = w.root

sun = w.root.S1.sunData

# all zeros- apparently there's no data here
[x.maindim for x in sun]

# 32 correstponds to Float32Atom?
[x.chunkshape for x in sun]

w.root
