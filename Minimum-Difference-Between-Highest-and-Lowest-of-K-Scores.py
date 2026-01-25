1class Solution(object):
2    def minimumDifference(self, nums, k):
3        nums = sorted(nums)
4        min_diff = float('inf')
5        for i in range(len(nums) - k + 1) :
6            diff = nums[i + k - 1] - nums[i]
7            if diff < min_diff : 
8                min_diff = diff 
9        return min_diff
10        