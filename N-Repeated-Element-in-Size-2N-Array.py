1class Solution(object):
2    def repeatedNTimes(self, nums):
3        match_num = len(nums) / 2
4        nums_dict = {}
5        for n in nums : 
6            if n in nums_dict : 
7                nums_dict[n]+=1
8                if nums_dict[n] == match_num : 
9                    return n
10            else : 
11                nums_dict[n]=1
12        