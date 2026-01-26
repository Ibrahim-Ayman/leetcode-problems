1class Solution(object):
2    def minimumAbsDifference(self, arr):
3        min_abs = float('inf')
4        arr = sorted(arr)
5        pairs = []
6        for i in range(len(arr) - 1) : 
7            diff = arr[i+1] - arr[i]
8            if diff < min_abs:
9                min_abs = diff
10                pairs = [[arr[i], arr[i+1]]]
11            elif diff == min_abs:
12                pairs.append([arr[i] , arr[i+1]])
13        return pairs
14        