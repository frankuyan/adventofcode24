

from itertools import product



from graphlib import TopologicalSorter
from itertools import product
from graphlib import TopologicalSorter
#from ...base import TextSolution, answer
#from ...utils.transformations import parse_int_list

## Day 5 print queue


# read  line 1 to 1176 as the rules
with open('day5/input.txt') as f:
    data = f.read().splitlines()
    rules = data[:1176]

# Create rules_dict as a hashmap where the first element will come ahead of the second element
rules_dict = {}
for rule in rules:
    parts = rule.split(": ")
    if len(parts) == 2:
        key = parts[0]
        values = parts[1].replace("or ", "|").split("|")
        rules_dict[key] = values

# Create a graph for topological sorting
graph = {}
for key, values in rules_dict.items():
    graph[key] = set()
    for value in values:
        range_parts = value.split("-")
        if len(range_parts) == 2:
            start, end = map(int, range_parts)
            for i in range(start, end + 1):
                if str(i) in rules_dict:
                    graph[key].add(str(i))

# Perform topological sort
ts = TopologicalSorter(graph)
sorted_rules = list(ts.static_order())

# Print the sorted rules
for rule in sorted_rules:
    print(f"{rule}: {rules_dict.get(rule, [])}")

#from ...base import TextSolution, answer
#from ...utils.transformations import parse_int_list






## Day 5 print queue

# read  line 1 to 1176 as the rules
with open('day5/input.txt') as f:
    data = f.read().splitlines()
    rules = data[:1176]
    #rules_dict = {line.split(": ")[0]: line.split(": ")[1].replace("or ", "|") for line in rules} 




#make the rules as a hashmap where the first element will come ahead of the second element

rules_dict = {}


for rule in rules:
    rule = rule.replace("or ", "|")
    rule = rule.split(": ")
    #rules_dict[rule[0]] = rule[1].split("|")
    #print(rule[0]r, rule[1])



