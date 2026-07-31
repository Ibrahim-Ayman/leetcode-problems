class Solution(object):
    def containsNearbyDuplicate(self, nums, k):
        hash = {}
        for ind , i in enumerate(nums) : 
            if i in hash : 
                hash[i].append(ind)
            else : 
                hash[i] = [ind]
        
        for arr in hash.values() : 
            s =0
            while s <= len(arr) - 2: 
                e = s+ 1
                needed_val = abs(arr[s] - arr[e])
                if needed_val <= k : 
                    return True 
                else : 
                    s+=1
        return False
        