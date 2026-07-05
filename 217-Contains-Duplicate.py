class Solution(object):
    def containsDuplicate(self, nums):
        nums_test = set(nums)
        if len(nums) == len(nums_test) : 
            return False 
        return True