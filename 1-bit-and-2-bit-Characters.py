class Solution(object):
    def isOneBitCharacter(self, bits):
        bits_len = len(bits)
        if bits_len > 1 :
            if bits[-1] == 0 and bits[-2] == 0 : 
                return True
            else : 
                n = 0 
                
                answer = []

                while n < bits_len : 
                    if bits[n] == 1 :
                        answer.append(False)
                        n+=2
                    else : 
                        answer.append(True)
                        n+=1
            
        else : 
                if bits[-1] == 0 :
                    return True
                else : 
                    False

        return answer[-1]

        