1class Solution(object):
2    def getMinDistance(self, nums, target, start):
3        min_value = len(nums)
4        for i in range(len(nums)) : 
5            if nums[i] == target : 
6                min_value = min(min_value , abs(i - start)) 
7        return min_value
8                
9        