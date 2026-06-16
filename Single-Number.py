1class Solution(object):
2    def singleNumber(self, nums):
3        nums = [num for num in nums if nums.count(num) == 1]
4        print(nums)
5        return nums[0]
6        