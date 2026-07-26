class Solution(object):
    def fourSum(self, nums, target):
        if len(nums) < 4 : 
            return []
        results = []
        nums.sort()

        for i in range(len(nums) - 3) : 
            for j in range(i+1,len(nums) - 2) :
                a , b = nums[i] , nums[j]
                k , l = j+1 , len(nums) - 1
                while  k < l : 
                    total = target - (a+b+nums[k]+nums[l])
                    if total == 0 : 
                        if [a,b,nums[k],nums[l]] not in results : 
                            results.append([a,b,nums[k],nums[l]])
                            print(i , l)
                            if i - l == 3 : 
                                return results
                            while k < l and nums[k] == nums[k+1] : 
                                k+=1
                            while k < l and nums[l] == nums[l-1] : 
                                l-=1
                        k+=1
                        l-=1
                    elif total < 0 : 
                        l-=1
                    else : 
                        k+=1
        print("test 4")
        return results
                        
                
        