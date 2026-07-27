class Solution(object):
    def rotate(self, nums, k):
        copy_nums = list(nums)
        k = k % len(nums)
        for i in range(len(nums)) :
            mod = (i+k) % len(nums)
            nums[mod] = copy_nums[i]
        return nums 

        