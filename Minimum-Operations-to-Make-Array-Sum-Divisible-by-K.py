1class Solution(object):
2    def minOperations(self, nums, k):
3        return sum(nums) % k 
4        