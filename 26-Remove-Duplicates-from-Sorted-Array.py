class Solution(object):
    def removeDuplicates(self, nums):
        curr_pointer , uni_pointer = nums[0] , nums[0]
        counter = 1
        length = len(nums)
        i = 1
        while i < length :
            curr_pointer = nums[i]
            if curr_pointer == uni_pointer : 
                nums.pop(i)
                length = len(nums)
                continue 
            else : 
                counter+=1
                i+=1
                uni_pointer = curr_pointer
        return counter