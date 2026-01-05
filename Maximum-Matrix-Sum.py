1class Solution(object):
2    def maxMatrixSum(self, matrix):
3        n = 0 
4        total = 0 
5        min_abs = float('inf')
6        for row in matrix : 
7            for column in row : 
8                if column < 0 : 
9                    n+=1
10                total += abs(column)
11                min_abs = min(min_abs, abs(column))
12        if n % 2 == 0:
13            return total
14        else : 
15            return total - 2 * min_abs
16