/*
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 # Example 1:

     Input:
     11110
     11010
     11000
     00000

 Output: 1
 
 # Example 2:

     Input:
     11000
     11000
     00100
     00011

 Output: 3
 
 */

class Solution {
    // !!!
    // 184 ms, faster than 78.70%
    // 21.5 MB, less than 25.00%
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        guard !grid[0].isEmpty else { return 0 }
        
        var result = 0
        var grid = grid
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    result += 1
                    dfs(grid: &grid, i, j) // 把所有同一個 land 的值都改成 water => 1 變成 0
                }
            }
        }
        
        return result
    }
    
    private func dfs(grid: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0 && i < grid.count
            && j >= 0 && j < grid[i].count
            && grid[i][j] == "1" else { return }
        
        grid[i][j] = Character("0")
        
        // !!!
        dfs(grid: &grid, i + 1, j)
        dfs(grid: &grid, i - 1, j)
        dfs(grid: &grid, i, j + 1)
        dfs(grid: &grid, i, j - 1)
    }
}

Solution().numIslands([["1","1","1","1","0"],
                       ["1","1","0","1","0"],
                       ["1","1","0","0","0"],
                       ["0","0","0","0","0"]]) // 1
Solution().numIslands([["1","1","0","0","0"],
                       ["1","1","0","0","0"],
                       ["0","0","1","0","0"],
                       ["0","0","0","1","1"]]) // 3
Solution().numIslands([["1","1","1"],
                       ["0","1","0"],
                       ["1","1","1"]]) // 1
