1class Solution(object):
2    def plusOne(self, digits):
3        digits = map(str , digits)
4        number = int("".join(digits)) + 1 
5        number = map(int , list(str(number)))
6        return number
7        