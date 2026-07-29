class Solution(object):
    def numRescueBoats(self, people, limit):
        people.sort(reverse=True)
        p1 , p2 =0 , len(people) - 1
        boat_count = 0
        while p1 < p2 :
                if people[p1] + people[p2] <= limit : 
                    p1+=1
                    p2-=1
                else : 
                    p1+=1
                boat_count+=1
        
        return boat_count + 1 if p1 == p2 else boat_count 
        