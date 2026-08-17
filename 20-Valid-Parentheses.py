class Solution(object):
    def isValid(self, s):
        if len(s) % 2 != 0 :
            return False
        stack = []
        for char in s:
            if char in ['{' , '(' , '[']:
                stack.append(char)
            if char in [']' , ')' , '}']:
                if stack == [] : 
                    return False
                else : 
                    if stack[-1] == '[' and char == ']' : 
                        stack.pop()
                    elif stack[-1] == '(' and char == ')' : 
                        stack.pop()
                    elif stack[-1] == '{' and char == '}' : 
                        stack.pop()
                    else:
                        return False 
        print(stack)
        if stack == [] :
           return True
        return False
