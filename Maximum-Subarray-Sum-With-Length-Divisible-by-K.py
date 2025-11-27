1class Solution:
2    def maxSubarraySum(self, nums: List[int], k: int) -> int:
3        prefix = [inf] * k
4        prefix[-1] = 0
5        res = -inf
6
7        for i , pre in enumerate(accumulate(nums)) : 
8            res = max(res , pre - prefix[i % k])
9            prefix[i % k] = min(prefix[i % k], pre)
10        return res
11