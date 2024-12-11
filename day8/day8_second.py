



def count_antinodes(map_data):
    antennas = {}
    for y, row in enumerate(map_data):
        for x, char in enumerate(row):
            if char.isalnum():
                if char not in antennas:
                    antennas[char] = []
                antennas[char].append((x, y))

    antinodes = set()

    for freq, positions in antennas.items():
        for i in range(len(positions)):
            for j in range(i + 1, len(positions)):
                dx = positions[j][0] - positions[i][0]
                dy = positions[j][1] - positions[i][1]
                distance = dx**2 + dy**2
                
                # Antinode at halfway point
                mid_x = positions[i][0] + dx/3
                mid_y = positions[i][1] + dy/3
                if 0 <= mid_x < len(map_data[0]) and 0 <= mid_y < len(map_data):
                    antinodes.add((int(mid_x), int(mid_y)))
                
                # Antinode at twice the distance
                far_x = positions[i][0] + 2*dx/3
                far_y = positions[i][1] + 2*dy/3
                if 0 <= far_x < len(map_data[0]) and 0 <= far_y < len(map_data):
                    antinodes.add((int(far_x), int(far_y)))

    return len(antinodes)

#import input.txt
#input_data = open("day8/input.txt")


def convert_data(input_data):
    # Only keep '0' and 'A' characters, replace others with '.'
    retain_chars = {'0', 'A'}
    
    # Split input into lines and process each line
    output_lines = []
    for line in input_data:
        # Convert each character in the line
        converted_line = ''.join(char if char in retain_chars else '.' for char in line)
        output_lines.append(converted_line)
    
    return output_lines



# If reading from a file
with open('day8/input.txt', 'r') as file:
    map_data = convert_data(file)



#this can be an example for us to   

print(count_antinodes(map_data))



# Example usage:
map_data11 = [
    "............",
    "........0...",
    ".....0......",
    ".......0....",
    "....0.......",
    "......A.....",
    "............",
    "............",
    "........A...",
    ".........A..",
    "............",
    "............",
]









#print(count_antinodes(map_data))  
#print(count_antinodes(map_data))  