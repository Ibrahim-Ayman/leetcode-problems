1class Solution(object):
2    def isTrionic(self, nums):
3        if len(nums) < 4 : 
4            return False
5        q , n = 0 , len(nums)
6        checkp , checkq , checkl = False , False , False
7        for i in range(n - 1) : 
8            if not checkp :
9                if nums[i+1] < nums[i]: 
10                    p = i
11                    checkp = True
12                    continue
13                elif nums[i+1] == nums[i] : 
14                    return False
15                else : 
16                    continue
17            elif not checkq : 
18                if nums[i+1] > nums[i]: 
19                    q = i 
20                    checkq = True
21                    continue
22                elif nums[i+1] == nums[i] : 
23                    return False
24                else : 
25                    continue
26        
27        if sorted(nums[q:n]) == nums[q:n] == sorted(set(nums[q:n])) : 
28                checkl = True
29        if checkl and checkp and checkq and 0 < p < q < n -1: 
30            return True 
31        else : 
32            return False
33        