1class Solution(object):
2    def numSteps(self, s):
3        n_dec = int(s , 2)
4        steps = 0 
5        while n_dec != 1 : 
6            if n_dec % 2 == 0 : 
7                n_dec /= 2
8            else : 
9                n_dec += 1 
10            steps += 1
11        return steps     
12        