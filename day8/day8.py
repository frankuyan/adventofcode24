

# day 8 of the advent of code 2024 
# Day 8: Resonant Collinearity 




import numpy as np
import sys
import re
from itertools import combinations



file = open('day8/input.txt', 'r')
input = file.readlines()
file.close()



for line in input:
    input[input.index(line)] = line.replace('\n', '')

# The variable "output" is what will be printed
output = ""

# Calculate amount of antinodes


#character search 
characters = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
antinodes = []

for x in range(len(characters)):

    ；i = characters.index(characters[x])

    loc = []

    for y in range(len(characters)):
        if characters[x] in input[y]:
            loc.append(y)

        x = input[line]
        for col in range(len(x)):



#antinode calculation 





# removing redundant nodes


# removing out of bounds nodes


# count of total valid nodes

