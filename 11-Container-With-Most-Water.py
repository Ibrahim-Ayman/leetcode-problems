class Solution(object):
    def maxArea(self, height):
        s , e = 0 , len(height) -1
        area = 0
        while e > s :
            w = e - s
            h = min(height[s] , height[e]) 
            area = max(area, w*h)
            if height[e] > height[s] :
                s+=1
            elif height[e] < height[s] : 
                e-=1
            else : 
                s+=1 
                e-=1
        return area
        