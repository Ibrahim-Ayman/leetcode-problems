class Solution(object):
    def dailyTemperatures(self, temperatures):
        answer = [0] * len(temperatures) 
        stack = []
        
        for i , temp in enumerate(temperatures):
            while stack != [] and temp > temperatures[stack[-1]]:
                past_day = stack.pop()
                answer[past_day] = i - past_day
            stack.append(i)  
        return answer
