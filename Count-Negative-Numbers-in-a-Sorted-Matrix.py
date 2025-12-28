1class Solution(object):
2    def countNegatives(self, grid):
3        count = 0
4        for arr in grid: 
5            for n in arr : 
6                if n < 0 : 
7                    count+=1
8        return count
9        