1class Solution(object):
2    def minDeletionSize(self, strs):
3        n = 0
4        for i in range(len(strs[0])) : 
5            column_chars = ''
6            for x in strs : 
7                column_chars += x[i]
8            needed = sorted(column_chars)
9            needed = ''.join(needed)
10            if column_chars != needed : 
11                n+=1
12        return n
13            