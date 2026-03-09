1class Solution(object):
2    def search(self, nums, target):
3        low = 0 
4        high = len(nums) - 1
5        while low <= high : 
6            mid = int((low + high) / 2)
7            if target == nums[mid] : 
8                return mid
9            else : 
10                if nums[mid] > target : 
11                    high = mid - 1
12                else : 
13                    low = mid + 1
14        return -1
15        