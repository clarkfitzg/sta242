'''
Builds out the timings.csv table by 
timing all the scripts
'''

import os
import subprocess
from glob import glob


reps = 1

# Run all timings in the matplotlib folder
for i in range(reps):
    for script in glob('matplotlib/*.py'):
