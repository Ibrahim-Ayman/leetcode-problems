1class Solution(object):
2    def addBinary(self, a, b):
3        return bin(int(a,2) + int(b,2)).replace("0b","")
4        