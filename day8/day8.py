

# day 8 of the advent of code 2024 
# Day 8: Resonant Collinearity 




import numpy as np
import sys
import re
from itertools import combinations



file = 'day8/input.txt'


def read_input(file):
    with open(file) as f:
        data = f.read().splitlines()
    return data


