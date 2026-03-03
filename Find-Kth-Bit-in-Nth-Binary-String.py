1class Solution(object):
2    def findKthBit(self, n, k):
3        last_string = "0"
4        needed_string = "0"
5        for i in range(2,n+1) :
6            needed_string = last_string + '1'
7            invert_string =''
8            for i in last_string : 
9                if i == '0' : 
10                    invert_string+= '1'
11                else :
12                    invert_string+= '0'
13            reversed_string = "".join(list(reversed(invert_string)))
14            needed_string = needed_string + reversed_string
15            last_string = needed_string
16        return needed_string[k-1:k]
17           
18            