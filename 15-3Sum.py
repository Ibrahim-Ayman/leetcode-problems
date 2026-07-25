class Solution(object):
    def threeSum(self, nums):
        results = []
        nums.sort()

        for i in range(len(nums)): 
            j , k = i+1 , len(nums) - 1
            
            while j < k : 
                total = nums[i] + nums[j] + nums[k]
                if total == 0 and [nums[i],nums[j],nums[k]]not in results: 
                    results.append([nums[i],nums[j],nums[k]])
                if total > 0 : 
                    k-=1
                else : 
                    j+=1
        return results