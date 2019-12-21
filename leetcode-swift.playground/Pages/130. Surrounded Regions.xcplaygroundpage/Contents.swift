/*
 
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

 # Example:

     X X X X
     X O O X
     X X O X
     X O X X
 
 After running your function, the board should be:

     X X X X
     X X X X
     X X X X
     X O X X
 
 Explanation:

 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 
 */

class Solution {
    // 196 ms, faster than 49.15%
    // 48.7 MB, less than 20.00%
//    func solve(_ board: inout [[Character]]) {
//        guard board.count > 2 && board[0].count > 2 else { return }
//        var checked = board
//        for i in 0..<board.count {
//            for j in 0..<board[i].count {
//                if checked[i][j] == "O" {
//                    let storeBoard = board
//                    var recover = false // 是否還原回 dfs 前的狀態
//                    dfs(&board, &checked, &recover, i, j)
//                    if recover == true { // 還原回 dfs 前的狀態，表示有碰到四邊
//                        board = storeBoard
//                    }
//                }
//            }
//        }
//    }
//
//    private func dfs(_ board: inout [[Character]], _ checked: inout [[Character]], _ recover: inout Bool, _ i: Int, _ j: Int) {
//        guard i >= 0 && i < board.count && j >= 0 && j < board[0].count else { return }
//        checked[i][j] = "-"
//        guard board[i][j] == "O" else { return }
//        board[i][j] = "X"
//        if i == 0 || i == board.count - 1 || j == 0 || j == board[0].count - 1 {
//            recover = true
//        }
//
//        dfs(&board, &checked, &recover, i + 1, j)
//        dfs(&board, &checked, &recover, i - 1, j)
//        dfs(&board, &checked, &recover, i, j + 1)
//        dfs(&board, &checked, &recover, i, j - 1)
//    }
    
    // 188 ms, faster than 61.02%
    // 21.5 MB, less than 20.00%
    func solve(_ board: inout [[Character]]) {
        guard board.count > 2 && board[0].count > 2 else { return }
        
        // Check "O" from sides, and make it to "T"
        
        // Top and bottom
        for i in 0..<board.count {
            mark(&board, i, 0)
            mark(&board, i, board[0].count - 1)
        }
        
        // Left and right
        for j in 0..<board[0].count {
            mark(&board, 0, j)
            mark(&board, board.count - 1, j)
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "O" { // make O to X
                    board[i][j] = "X"
                } else if board[i][j] == "T" { // make T to O
                    board[i][j] = "O"
                }
            }
        }
    }
    
    func mark(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0 && i < board.count && j >= 0 && j < board[i].count else { return }
        guard board[i][j] == "O" else { return }
        
        board[i][j] = "T"
        
        mark(&board, i + 1, j)
        mark(&board, i - 1, j)
        mark(&board, i, j + 1)
        mark(&board, i, j - 1)
    }
}

var board: [[Character]] = [["X","X","X","X"],
                            ["X","O","O","X"],
                            ["X","X","O","X"],
                            ["X","O","X","X"]]
Solution().solve(&board)
/*
 [["X","X","X","X"],
  ["X","X","X","X"],
  ["X","X","X","X"],
  ["X","O","X","X"]]
 */

board = [["X","O","X"],
         ["O","X","O"],
         ["X","O","X"]]
Solution().solve(&board)
/*
 [["X","O","X"],
  ["O","X","O"],
  ["X","O","X"]]
 */
