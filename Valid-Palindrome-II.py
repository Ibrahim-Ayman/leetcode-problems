1class Solution(object):
2    def validPalindrome(self, s):
3        s = list(s)
4        firp , secp = 0 , len(s) - 1
5        done = False
6        while firp < secp : 
7            if s[firp] == s[secp] : 
8                firp += 1
9                secp -= 1
10            elif s[firp] == s[secp-1] and s[firp+1] == s[secp] and done == False :
11                s_needed1 = s[firp+1:secp-1]
12                s_needed1_test = list(reversed(s_needed1))
13                s_needed2 = s[firp+2:secp]
14                s_needed2_test = list(reversed(s_needed2))
15                if s_needed1 == s_needed1_test : 
16                    return True
17                elif s_needed2 == s_needed2_test : 
18                    return True
19                return False
20            elif s[firp] == s[secp-1] and done == False: 
21                print(done)
22                firp +=1 
23                secp -=2
24                done = True
25            elif s[firp+1] == s[secp] and done == False:
26                firp += 2
27                secp -=1
28                done = True
29            else : 
30                return False
31        return True
32