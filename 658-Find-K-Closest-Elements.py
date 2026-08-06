class Solution(object):
    def findClosestElements(self, arr, k, x):
        if x <= arr[0] : 
            return arr[0:k]
        elif x >= arr[-1] : 
          return arr[len(arr)-k:len(arr)]
        else : 
            min_close = sum([abs(n-x) for n in arr[0:k]])
            result = arr[0:k]
            # for n in arr[0:k] : 
            #     min_close+=abs(n-x)
            i =1
            left_result = i
            right_result = i+k
            chk_arr = [min_close]
            while i + k <= len(arr) : 
                chk_close = min_close - abs(arr[i-1] - x) + abs(arr[i+k-1] - x)
                chk_arr.append(chk_close)
                if chk_close < min_close : 
                    left_result = i
                    right_result = i+k
                    min_close=chk_close
                    result = arr[left_result:right_result]
                i+= 1
            return result