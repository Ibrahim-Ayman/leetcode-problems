class Solution(object):
    def numSub(self, s):
        substrings_ones = s.split('0')
        num = 0
        for substring in substrings_ones : 
            substring_length = len(substring)
            numberOfOnes = (substring_length * (substring_length + 1))/ 2
            num += numberOfOnes
            num %= 10**9 + 7
        
        return num
        