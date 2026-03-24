1class Solution(object):
2    def kidsWithCandies(self, candies, extraCandies):
3        max_num = max(candies)
4        result = []
5        for candie in candies : 
6            if candie + extraCandies >= max_num : 
7                result.append(True)
8            else : 
9                result.append(False)
10        return result
11        