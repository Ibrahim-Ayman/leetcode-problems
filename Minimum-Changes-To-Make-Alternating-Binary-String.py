1class Solution(object):
2    def minOperations(self, s):
3        first_count = 0
4        if s[0:1] == '0' : 
5            start_0 = True
6        else : 
7            start_0 = False
8        for i in range(len(s)) : 
9            if start_0 :
10                if (i % 2 == 0 and s[i] == '1') or (i % 2 != 0 and s[i] == '0'): 
11                    first_count+=1
12            if not start_0 :
13                if (i % 2 == 0 and s[i] == '0') or (i % 2 != 0 and s[i] == '1'): 
14                    first_count+=1
15        second_count = 1
16        if s[0:1] == '0' : 
17            start_0 = False
18            second_s = '1' + s[1:]
19        else : 
20            start_0 = True
21            second_s = '0' + s[1:]
22        for i in range(len(second_s)) : 
23            if start_0 :
24                if (i % 2 == 0 and second_s[i] == '1') or (i % 2 != 0 and second_s[i] == '0'): 
25                    second_count+=1
26            if not start_0 :
27                if (i % 2 == 0 and second_s[i] == '0') or (i % 2 != 0 and second_s[i] == '1'): 
28                    second_count+=1
29        return min(first_count , second_count)
30        