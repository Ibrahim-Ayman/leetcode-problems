class Solution(object):
    def calPoints(self, operations):
        stack = []
        ptr = -1
        for oper in operations : 
            if oper == "+" : 
                stack.append(stack[ptr] + stack[ptr - 1])
                ptr+=1
            elif oper == "D" : 
                stack.append(stack[ptr] * 2)
                ptr+=1
            elif oper == "C" : 
                stack.pop(ptr)
                ptr-=1
            else : 
                stack.append(int(oper))
                ptr+=1
        return sum(stack)
            
        