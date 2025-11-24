class Solution(object):
    def removeElement(self, nums, val):
        nums_length = len(nums)
        occurance_val = nums.count(val)
        for n in range(occurance_val):
            nums.remove(val)
            # nums.append('_')
        return nums_length - occurance_val
        