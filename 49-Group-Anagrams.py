class Solution(object):
    # def group_list(self,list_inp):
    #     return "".join(list_inp)

    def groupAnagrams(self,s_list) :
        needed_list = s_list[:]
        sorted_list = map(sorted ,needed_list)
        sorted_list = list(sorted_list)
        group_list = lambda list_inp : "".join(list_inp)
        groupbed = list(map(group_list ,sorted_list))

        result = []
        visited = []
        for num in range(len(groupbed)): 
            anagram = [s_list[num]]
            if num not in visited : 
                for num2 in range(num+1,len(groupbed)) : 
                    if groupbed[num] == groupbed[num2] and num2 not in visited: 
                        anagram.append(s_list[num2])
                        visited.append(num2)
                result.append(anagram)


        return result
        