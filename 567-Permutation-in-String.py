class Solution(object):
    def checkInclusion(self, s1, s2):
        window_width = len(s1)
        if window_width > len(s2) : 
            return False 
        count1 = [0] * 26
        count2 = [0] * 26

        for char in s1 : 
            count1[ord(char) - ord('a')]+=1
        for char in s2[0:window_width] : 
                count2[ord(char) - ord('a')]+=1
        
        i = 0
        while i + window_width <= len(s2):
            if count1 == count2 : 
                return True 
            count2[ord(s2[i]) - ord('a')]-=1
            if window_width+i >= len(s2) : 
                break
            count2[ord(s2[window_width+i])-ord('a')] +=1
            i+=1
                
        return False