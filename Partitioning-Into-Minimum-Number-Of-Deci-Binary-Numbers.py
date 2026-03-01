1class Solution(object):
2    def minPartitions(self, n):
3        max_num = 0 
4        for i in n : 
5            max_num = max(max_num, int(i))
6        return max_num