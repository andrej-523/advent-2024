
def aa(matrix, indexX, indexY, difx, dify):
    x = indexX + difx
    y = indexY + dify
    aa = ["M", "A", "S"] 

    for i in range(3):
        if not (0 <= x < len(matrix) and 0 <= y < len(matrix[0])):
            return False

        if matrix[x][y] != aa[i]:
            return False

        x += difx
        y += dify

    return True

def aaa(matrix, x, y):

	if y < 1 or y > len(matrix) - 2 or x < 1 or x > len(matrix[0]) - 2:
		return False

	if (matrix[x+1][y+1] == "M" and matrix[x-1][y-1] == "S") or (matrix[x+1][y+1] == "S" and matrix[x-1][y-1] == "M"):
		if (matrix[x+1][y-1] == "M" and matrix[x-1][y+1] == "S") or (matrix[x+1][y-1] == "S" and matrix[x-1][y+1] == "M"):
			return True

	return False
		
matrix = []

with open('input.txt', 'r') as file:
    for line in file:
        matrix.append(list(line.strip()))

count = 0
count2 = 0

for row_index, row in enumerate(matrix):
    for col_index, element in enumerate(row):
        if element == 'X':
            if aa(matrix, row_index, col_index, 1, 0):
                count += 1
            if aa(matrix, row_index, col_index, 1, 1):
                count += 1
            if aa(matrix, row_index, col_index, 0, 1):
                count += 1
            if aa(matrix, row_index, col_index, -1, 1):
                count += 1
            if aa(matrix, row_index, col_index, -1, 0):
                count += 1
            if aa(matrix, row_index, col_index, 1, -1):
                count += 1
            if aa(matrix, row_index, col_index, 0, -1):
                count += 1
            if aa(matrix, row_index, col_index, -1, -1):
                count += 1

        if element == 'A':
            if aaa(matrix, row_index, col_index):
                count2 += 1

print("Count:", count)
print("Count:", count2)