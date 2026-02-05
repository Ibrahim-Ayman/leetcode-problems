1class Solution(object):
2    def constructTransformedArray(self, nums):
3        if len(nums) == 1 : 
4            return nums
5        n = len(nums)
6        result = [0] * n
7        for i in range(n) : 
8            if nums[i] > 0 : 
9                steps = (nums[i] + i) % n 
10                result[i] = nums[steps]
11            elif nums[i] < 0 : 
12                temp = i
13                steps = abs(nums[i]) % n
14                temp-=steps
15                result[i] = nums[temp]
16            else :
17                result[i] = 0
18        return result
19        