# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def isPalindrome(self, head):
        array = []
        while head != None :
            array.append(head.val)
            head = head.next
        for i in range(len(array) / 2) :
            print(i)
            if array[i] != array[len(array) - i - 1] :
                return False
        return True