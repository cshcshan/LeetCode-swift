/*
 Example:
 X..X
 ...X
 ...X
 In the above board there are 2 battleships.
 
 Invalid Example:
 ...X
 XXXX
 ...X
 
 */

class Solution {
  func countBattleships(_ board: [[Character]]) -> Int {
    var value = 0
    
    for i in 0..<board.count {
      for j in 0..<board[i].count {
        if board[i][j] == "X" {
          if i > 0 {
            if board[i-1][j] == "X" {
              continue
            }
          }
          if j > 0 {
            if board[i][j-1] == "X" {
              continue
            }
          }
          value += 1
        }
      }
    }
    
    return value
  }
}
Solution().countBattleships([["X","."]])
//Solution().countBattleships(["X..X","...X","...X"])
