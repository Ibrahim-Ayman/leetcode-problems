1class Solution(object):
2    def isPalindrome(self, s):
3        s = str(s)
4        s = "".join(filter(str.isalnum,s)).lower()
5        s2 = "".join(list(reversed(s)))
6        return s2 == s
7        