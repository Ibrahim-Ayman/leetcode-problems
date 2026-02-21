1class Solution(object):
2    def is_prime(self,n) : 
3        return n > 1 and all(n % i != 0 for i in range(2, int(n**0.5) + 1))
4    def countPrimeSetBits(self,left, right):
5        count = 0
6        for n in range(left,right+1) : 
7            n_bin = bin(n)[2:]
8            count_1s = n_bin.count('1')
9            if self.is_prime(count_1s) : 
10                count+=1
11        return count
12        