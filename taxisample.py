'''
Randomly sample from a month of the taxi data and save the resulting CSV

Run this on the server or some place where the full data is located.
'''

import os

import numpy as np
import pandas as pd


def unique_columns(dframe):
    '''
    Return the dataframe with only the unique column names
    '''

    # Find the integer indices for unique values by taking the one that
    # appears first
    seen = set()
    indices = []
    for index, name in enumerate(dframe.columns):
        if name not in seen:
            seen.add(name)
            indices.append(index)

    return dframe.iloc[:, indices]


def samplerows(dframe, size_MB, replace=False):
    '''
    Randomly sample a dataframe to be no larger than size_MB

    Note- Assumes all data is 64 bit numeric arrays
    '''

    bytesize = size_MB * 2 ** 20
    n, p = dframe.shape
    nrows = int(min(n, bytesize / (8 * p)))
    rows = np.random.choice(dframe.index.values, nrows, replace=replace)

    return dframe.loc[rows]

 
def main(size_MB, taxidir, outfile):

    # Change this line to sample from other files
    filenames = ['trip_data_1.csv', 'trip_fare_1.csv']
    filenames = [os.sep.join((taxidir, x)) for x in filenames]

    # Join the two dataframes
    taxi = pd.concat([pd.read_csv(x) for x in filenames], axis=1)

    # Strip out whitespace from column names
    taxi = taxi.rename(columns=lambda x: x.strip())

    taxi = unique_columns(taxi)

    taxisample = samplerows(taxi, size_MB)

    taxisample.to_csv(outfile, index=False)


if __name__ == '__main__':

    main(size_MB=200, taxidir='data', outfile='data/taxi.csv')
