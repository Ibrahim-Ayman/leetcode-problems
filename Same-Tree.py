1# Definition for a binary tree node.
2# class TreeNode(object):
3#     def __init__(self, val=0, left=None, right=None):
4#         self.val = val
5#         self.left = left
6#         self.right = right
7class Solution(object):
8    def isSameTree(self, p, q):
9        q1 = [p]
10        q2 = [q]
11        while q1 : 
12            node1 = q1.pop(0)
13            node2 = q2.pop(0)
14            if node1 is not None and node2 is not None : 
15                if node1.val == node2.val : 
16                    q1.extend([node1.left ,node1.right])
17                    print(q1)
18                    q2.extend([node2.left ,node2.right])
19                    print(q2)
20                else : 
21                    return False
22            elif node1 is None and node2 is None : 
23                continue
24            else : 
25                return False  
26        return True