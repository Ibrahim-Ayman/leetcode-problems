1class MyHashSet(object):
2
3    def __init__(self):
4        self.my_set = set()
5
6    def add(self, key):
7        return self.my_set.add(key)
8        
9    def remove(self, key):
10        return self.my_set.discard(key)
11        
12    def contains(self, key):
13        return key in self.my_set
14
15
16# Your MyHashSet object will be instantiated and called as such:
17# obj = MyHashSet()
18# obj.add(key)
19# obj.remove(key)
20# param_3 = obj.contains(key)