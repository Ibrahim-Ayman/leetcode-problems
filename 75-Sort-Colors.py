class Solution(object):
    def sortColors(self, nums):
        count_0s = 0
        count_1s = 0
        for color in nums : 
            if color == 0 : 
                count_0s+=1
            elif color == 1 : 
                count_1s+=1
        for i in range(len(nums)) : 
            if count_0s > 0 : 
                nums[i] = 0 
                count_0s -= 1
                continue 
            elif count_1s > 0 : 
                nums[i] = 1 
                count_1s-=1
                continue 
            else : 
                nums[i] = 2 

             
        
        