1class Solution(object):
2    def binaryGap(self, n):
3        n_bin = bin(n)
4        distance = 0
5        for i in range(len(n_bin)) : 
6            if n_bin[i] == '1' : 
7                for j in range(i+1 , len(n_bin)) : 
8                    if n_bin[j] == '0' : 
9                        continue 
10                    else : 
11                        distance = max(distance , j-i) 
12                        i = j
13                        break
14        return distance 
15        