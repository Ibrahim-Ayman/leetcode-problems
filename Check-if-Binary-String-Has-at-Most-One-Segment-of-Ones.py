1class Solution(object):
2    def checkOnesSegment(self, s):
3        check = False
4        for i in s : 
5            if i == '0' and check == False : 
6                check = True
7            elif (i == '1' and check == False) or (i == '0' and check == True) : 
8                continue 
9            else : 
10                return False
11        return True
12            
13        