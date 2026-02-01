1class Solution(object):
2    def minimumCost(self, nums):
3        sorted_nums = sorted(nums[1:])
4        return nums[0] + sorted_nums[0] + sorted_nums[1]
5
6        