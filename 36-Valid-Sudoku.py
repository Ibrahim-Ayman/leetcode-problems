class Solution(object):
    def isValidSudoku(self, board):
        sub_boxes = {}

        for i in range(0,9) :
            col = [] 
            row = [] 
            for k in range (0,9) : 
                needed_i = (i/3)
                box_num =  needed_i * 3 + k / 3
                if board[i][k] != "." :
                    if box_num not in sub_boxes : 
                        sub_boxes[box_num] = [int(board[i][k])]
                    else : 
                        sub_boxes[box_num].append(int(board[i][k]))
                    col.append(board[i][k])
                if board[k][i] != "." :
                    row.append(board[k][i])
            if len(row) != len(set(row)) : 
                print(row , set(row))
                print(1)
                return False 
            if len(col) != len(set(col)) : 
                print(2)
                return False 

        for sub_box in sub_boxes : 
            if len(sub_boxes[sub_box]) != len(set(sub_boxes[sub_box])) : 
                print(3)
                return False 
        return True

        