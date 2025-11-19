class Solution(object):
    def findFinalValue(self, nums, original):
        nums_len = len(nums)
        i = 0 
        while i < nums_len : 
            if nums[i] == original : 
                original = original * 2 
                i = 0
            else : 
                i+=1
        return original
        