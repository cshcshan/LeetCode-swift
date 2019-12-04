/*
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?


 Above is a 7 x 3 grid. How many possible unique paths are there?

 Note: m and n will be at most 100.

 # Example 1:

 Input: m = 3, n = 2
 Output: 3
 
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 
 # Example 2:

 Input: m = 7, n = 3
 Output: 28
 
 */

class Solution {
    // Time Limit Exceeded
//    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//        var count = 0
//        recursive(m - 1, n - 1, &count)
//        return count
//    }
//
//    private func recursive(_ restRight: Int, _ restDown: Int, _ count: inout Int) {
//        guard restRight > 0 && restDown > 0 else {
//            count += 1
//            return
//        }
//        if restRight > 0 {
//            recursive(restRight - 1, restDown, &count)
//        }
//        if restDown > 0 {
//            recursive(restRight, restDown - 1, &count)
//        }
//    }
    
    // !!!
    // 0 ms, faster than 100.00%
    // 20.8 MB, less than 50.00%
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 1 && n > 1 else { return 1 }
        var matrix: [[Int]] = [[Int]](repeating: [Int](repeating: 1, count: n), count: m) // 建立 m * n 的二維陣列，值都為 1
        for i in 1..<m {
            for j in 1..<n {
                matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
            }
        }
        return matrix[m-1][n-1]
    }
}

Solution().uniquePaths(3,2) // 3
Solution().uniquePaths(4,3) // 10
/*
 1  1  1  1
 1  2  3  4
 1  3  6 10
 */
Solution().uniquePaths(7,3) // 28
Solution().uniquePaths(19,13) // 86493225
