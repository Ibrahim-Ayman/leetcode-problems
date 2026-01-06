1# Definition for a binary tree node.
2# class TreeNode(object):
3#     def __init__(self, val=0, left=None, right=None):
4#         self.val = val
5#         self.left = left
6#         self.right = right
7class Solution(object):
8    def maxLevelSum(self, root):
9        n_level = 1
10        re_level = 1          # FIX 1
11        total = root.val
12
13        nodes = [[root]]
14
15        while nodes:
16            level_node = nodes.pop()
17            curr_level = []
18            post_node = []
19
20            # move increment here
21            n_level += 1      # FIX 2 (correct placement)
22
23            for node in level_node:
24                if node.left:
25                    post_node.append(node.left)
26                    curr_level.append(node.left.val)
27                if node.right:
28                    post_node.append(node.right)
29                    curr_level.append(node.right.val)
30
31            if curr_level and sum(curr_level) > total:
32                re_level = n_level
33                total = sum(curr_level)
34
35            if post_node:
36                nodes.append(post_node)
37
38        return re_level
39
40