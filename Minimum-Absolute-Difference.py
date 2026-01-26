1class Solution(object):
2    def minimumAbsDifference(self, arr):
3        min_abs = float('inf')
4        arr = sorted(arr)
5        for i in range(len(arr) - 1) : 
6            if arr[i+1] - arr[i] < min_abs : 
7                min_abs = arr[i+1] - arr[i]
8
9        pairs = []
10        for i in range(len(arr) - 1) : 
11            if arr[i+1] - arr[i] == min_abs : 
12                pairs.append([arr[i] , arr[i+1]])
13        return pairs
14        