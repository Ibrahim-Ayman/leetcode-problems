class Solution(object):
    def reverseString(self, s):
        left , right = 0 , len(s) -1
        while left < right : 
            hold = s[left]
            s[left] = s[right]
            s[right] = hold
            right-=1
            left+=1            
        