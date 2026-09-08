# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def hasCycle(self, head):
        visited = []
        while head: 
            if head.next == None: 
                return False
            else:
                head = head.next 
                if head in visited : 
                    return True
                visited.append(head)
        return False
