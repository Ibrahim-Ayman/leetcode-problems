1class Solution(object):
2    def minPairSum(self, nums):
3        nums = sorted(nums)
4
5        max_pair = 0 
6        for i in range(len(nums) / 2) : 
7            if nums[i] + nums[len(nums) - i - 1] > max_pair : 
8                max_pair = nums[i] + nums[len(nums) - i - 1]
9
10        return max_pair
11            