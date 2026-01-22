1class Solution(object):
2    def minimumPairRemoval(self, nums):
3        n_op = 0 
4        if nums == sorted(nums) : 
5            return 0
6        while True : 
7            needed_pair = float('inf')
8            num = 0
9            adjNum = 1
10            for i in range(len(nums) - 1): 
11                if min(needed_pair , nums[i]+nums[i+1]) != needed_pair : 
12                    needed_pair = min(needed_pair , nums[i]+nums[i+1])
13                    num = i 
14                    adjNum = i + 1
15            nums[num] = nums[num] + nums[adjNum]
16            nums.pop(adjNum)
17            n_op+=1
18            if nums == sorted(nums) : 
19                return n_op
20        
21        