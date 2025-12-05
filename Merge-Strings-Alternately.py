1class Solution(object):
2    def mergeAlternately(self, word1, word2):
3        l = len(word1) if len(word1) > len(word2) else len(word2)
4        n = 0
5        mergeedString = ''
6        while n < l : 
7            try:
8                if word1[n] : 
9                    mergeedString+=word1[n]
10            except IndexError:
11                pass
12            try:
13                if word2[n] : 
14                    mergeedString+=word2[n]
15            except IndexError:
16                pass
17            n+=1
18        return mergeedString
19            
20
21        