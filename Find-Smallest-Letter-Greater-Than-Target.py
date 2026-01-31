1class Solution(object):
2    def nextGreatestLetter(self, letters, target):
3        letters = sorted(set(letters))
4        for letter in letters : 
5            if letter > target : 
6                return letter 
7        for e in letters:
8            break
9        return e
10        