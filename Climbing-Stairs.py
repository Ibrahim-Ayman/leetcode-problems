1class Solution(object):
2    def climbStairs(self, n):
3        # if n <= 1 : 
4        #     return 1
5        # return self.climbStairs(n-1) + self.climbStairs(n-2)
6        if n <=1 : 
7            return 1
8        stairs = []
9        for i in range(n):
10            if i <= 1 : 
11                stairs.append(1)
12            else : 
13                stairs.append(stairs[i-1]+stairs[i-2])
14        return stairs[-1] + stairs[-2]