1class Solution(object):
2    def sortByBits(self, arr):
3        arr = sorted(arr)
4        num_dict = {}
5        answer = []
6        for n in arr : 
7            n_bin = bin(n)[2:]
8            count1s = n_bin.count('1')
9            if count1s in num_dict : 
10                num_dict[count1s].append(n)
11            else : 
12                num_dict[count1s] = [n]
13
14        for val in num_dict : 
15            answer += (num_dict[val])
16        return answer
17
18            
19        