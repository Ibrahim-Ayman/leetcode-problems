1class Solution(object):
2    def countOdds(self, low, high):
3        if ((low % 2 == 0) and (high % 2 == 1)) or ((high % 2 == 0) and (low % 2 == 1)) : 
4            n = 1
5            n += (high - low -1 ) / 2
6        elif (low % 2 == 0) and (high % 2 == 0) : 
7            n = 0
8            n += (high - low) / 2
9        else : 
10            n = 2 
11            n += ((high - low) / 2) - 1
12        return n
13        