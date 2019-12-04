/*
 
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.

 A partially filled sudoku which is valid.

 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

 # Example 1:

 Input:
 [
   ["5","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true
 
 # Example 2:

 Input:
 [
   ["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 Output: false
 
 Explanation: Same as Example 1, except with the 5 in the top left corner being
     modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 The given board contain only digits 1-9 and the character '.'.
 The given board size is always 9x9.
 
 */

class Solution {
    // 148 ms, faster than 55.72%
    // 21.3 MB, less than 100.00%
//    func isValidSudoku(_ board: [[Character]]) -> Bool {
//        var rowsExist = [Bool](repeating: false, count: 9)
//        var colExist = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9) // 9 * 9
//        var blockExist = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 3) // 3 * 9
//        for row in 0..<9 {
//            for col in 0..<9 {
//                if let num = Int(String(board[row][col])) {
//                    print("row: \(row), col: \(col), num: \(num)")
//                    let index = num - 1
//                    // check rows
//                    if rowsExist[index] {
//                        return false
//                    }
//                    rowsExist[index] = true
//
//                    // check cols
//                    if colExist[col][index] {
//                        return false
//                    }
//                    colExist[col][index] = true
//
//                    // check blocks
//                    /*
//                        0~2列在block 1
//                        3~5列在block 2
//                        6~8列在block 3
//                     */
//                    let block = Int(col / 3)
//                    if blockExist[block][index] {
//                        return false
//                    }
//                    blockExist[block][index] = true
//                }
//            }
//            rowsExist = [Bool](repeating: false, count: 9)
//            if (row + 1) % 3 == 0 {
//                blockExist = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 3)
//            }
//        }
//        return true
//    }
    
    // !!!
    // 144 ms, faster than 74.13%
    // 20.6 MB, less than 100.00%
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Set<Character>()
        var colSet = Set<Character>()
        var blockSet = Set<Character>()
        // check rows and cols
        for i in 0..<9 {
            rowSet.removeAll()
            colSet.removeAll()
            for j in 0..<9 {
                let rowVal = board[i][j]
                let colVal = board[j][i]
                if rowVal != "." {
                    if rowSet.contains(rowVal) {
                        return false
                    }
                    rowSet.insert(rowVal)
                }
                if colVal != "." {
                    if colSet.contains(colVal) {
                        return false
                    }
                    colSet.insert(colVal)
                }
            }
        }
        // check blocks
        for iBlock in 0..<3 {
            for jBlock in 0..<3 {
                blockSet.removeAll()
                let row = iBlock * 3
                let col = jBlock * 3
                
                for x in row..<row+3 {
                    for y in col..<col+3 {
                        let val = board[x][y]
                        if val != "." {
                            if blockSet.contains(val) {
                                return false
                            }
                            blockSet.insert(val)
                        }
                    }
                }
            }
        }
        return true
    }
}

Solution().isValidSudoku([
    [".",".","4",".",".",".","6","3","."],
    [".",".",".",".",".",".",".",".","."],
    ["5",".",".",".",".",".",".","9","."],
    [".",".",".","5","6",".",".",".","."],
    ["4",".","3",".",".",".",".",".","1"],
    [".",".",".","7",".",".",".",".","."],
    [".",".",".","5",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."]
]) // false

Solution().isValidSudoku([
    [".",".","4",".",".",".","6","3","."],
    [".",".",".",".",".",".",".",".","."],
    ["5",".",".",".",".",".",".","9","."],
    [".",".",".","5","6",".",".","5","."],
    ["4",".","3",".",".",".",".",".","1"],
    [".",".",".","7",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."]
]) // false

Solution().isValidSudoku([
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]) // true

Solution().isValidSudoku([
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]) // false
