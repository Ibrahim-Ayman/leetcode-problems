1class Solution(object):
2    def findDifferentBinaryString(self, nums):
3        length = len(nums)
4        deci_nums = list(map(lambda x: int(x , 2) , nums))
5        for i in range(pow(2,length)) : 
6            if i in deci_nums : 
7                continue
8            else :
9                return str(bin(i)[2:].zfill(length))
10            