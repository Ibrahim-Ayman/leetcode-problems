1class Solution(object):
2    def hasAllCodes(self,s, k):
3        need = 1 << k
4        n = len(s)
5        if n < k:
6            return False
7        if n - k + 1 < need:
8            return False
9
10        seen = [False] * need
11        mask = need - 1
12
13        val = 0
14        # build first k bits
15        for i in range(k):
16            val = (val << 1) | (s[i] == '1')
17
18        seen[val] = True
19        found = 1
20
21        for i in range(k, n):
22            val = ((val << 1) & mask) | (s[i] == '1')
23            if not seen[val]:
24                seen[val] = True
25                found += 1
26                if found == need:
27                    return True
28
29        return found == need
30            