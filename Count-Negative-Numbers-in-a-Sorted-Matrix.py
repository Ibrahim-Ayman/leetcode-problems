1class Solution(object):
2    def countNegatives(self, grid):
3        count = 0
4        for arr in grid: 
5            count_arr = 0
6            for n in arr :                 
7                if n < 0 : 
8                    break
9                count_arr+=1
10            if count_arr != len(arr):
11                count+=len(arr)-count_arr
12        return count