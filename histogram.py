import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from loadtaxi import *


x = taxi['total_amount'][taxi['total_amount'] <= 100]
plt.hist(x)
