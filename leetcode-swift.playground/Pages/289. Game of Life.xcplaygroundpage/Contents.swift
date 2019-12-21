/*

 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.

 # Example:

 Input:
     [
       [0,1,0],
       [0,0,1],
       [1,1,1],
       [0,0,0]
     ]
 
 Output:
     [
       [0,0,0],
       [1,0,1],
       [0,1,1],
       [0,1,0]
     ]
 
 Follow up:

 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 
 */

class Solution {
    // 4 ms, faster than 100.00%
    // 20.6 MB, less than 100.00%
    func gameOfLife(_ board: inout [[Int]]) {
        /*
        1. live cell 附近有小於但不包含 2 個 live cells => dies
            1 -> 0 => 1 && 0 << 1 = Ob01 = 1
        2. live cell 附近有 2 或 3 個 live cells => live
            1 -> 1 => 1 && 1 << 1 = Ob11 = 3
        3. live cell 附近有超過 3 個 live cells => dies
            1 -> 0 => 1 && 0 << 1 = Ob01 = 1
        4. dead cell 附近有 3 個 live cells => live
            0 -> 1 => 0 && 1 << 1 = Ob10 = 2
        */
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                let count = checkLives(&board, i, j)
                let isLive = ((board[i][j] % 2) == 1)
                if isLive {
                    if count < 2 || count > 3 {
                        board[i][j] = 1 // die
                    } else {
                        board[i][j] = 3 // live
                    }
                } else {
                    if count == 3 {
                        board[i][j] = 2 // live
                    }
                }
            }
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = Int(board[i][j] / 2)
            }
        }
    }
    
    private func checkLives(_ board: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        var count = 0
        for ii in i-1...i+1 {
            for jj in j-1...j+1 {
                guard ii >= 0 && ii < board.count && jj >= 0 && jj < board[ii].count else { continue }
                guard ii != i || jj != j else { continue }
                if board[ii][jj] % 2 == 1 { // 原本是 1
                    count += 1
                }
            }
        }
        return count
    }
}

var board = [[0,1,0],
             [0,0,1],
             [1,1,1],
             [0,0,0]]
Solution().gameOfLife(&board)
/*
 [
  [0,0,0],
  [1,0,1],
  [0,1,1],[0,1,0]
 ]
 */
