1class Solution(object):
2    def countPartitions(self, nums):
3        n = 0
4
5        for i in range(1,len(nums)) : 
6            s_arr1 = sum(nums[0:i])
7            s_arr2 = sum(nums[i:len(nums)])
8
9            if (s_arr1 - s_arr2) % 2 == 0 : 
10                n+=1
11        return n
12        