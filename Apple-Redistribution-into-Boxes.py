1class Solution(object):
2    def minimumBoxes(self, apple, capacity):
3        apples_number = sum(apple)
4        capacity = sorted(capacity , reverse = True)
5        num = 0
6        for cap in capacity: 
7            apples_number = apples_number - cap
8            num+=1
9            if apples_number <= 0 :
10                return num 
11        return num 