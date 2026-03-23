1class Solution(object):
2    def findWordsContaining(self, words, x):
3        result = []
4        for n in range(len(words)) : 
5            if x in words[n] :
6                result.append(n)
7        return result