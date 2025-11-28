1class Solution(object):
2    def majorityElement(self, nums):
3        num_exist = {}
4        for i in nums : 
5            if i in num_exist :
6                num_exist[i] += 1
7            else : 
8                num_exist[i] = 1
9        return max(num_exist , key=num_exist.get)