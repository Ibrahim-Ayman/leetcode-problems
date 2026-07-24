class Solution(object):
    def twoSum(self, numbers, target):
        s , e = 0 , len(numbers) - 1
        while s != e : 
            chk = numbers[s] + numbers[e]
            if chk == target: 
                return [s+1 , e+1]
            elif chk > target : 
                e-=1
            else : 
                s+=1