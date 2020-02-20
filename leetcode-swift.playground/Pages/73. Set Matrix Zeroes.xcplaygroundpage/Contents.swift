/*
 
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
 
 # Example 1:
 
 Input:
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 Output:
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 
 # Example 2:
 
 Input:
 [
   [0,1,2,0],
   [3,4,5,2],
   [1,3,1,5]
 ]
 
 Output:
 [
   [0,0,0,0],
   [0,4,5,0],
   [0,3,1,0]
 ]
 
 Follow up:
 
 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 
 */

class Solution {
    // 120 ms, faster than 98.91%
    // 21 MB, less than 100.00%
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else { return }
        guard matrix[0].count > 0 else { return }
        
        var zeroI = [Bool](repeating: false, count: matrix.count)
        var zeroJ = [Bool](repeating: false, count: matrix[0].count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == 0 {
                    zeroI[i] = true
                    zeroJ[j] = true
                }
            }
        }
        for i in 0..<zeroI.count {
            for j in 0..<zeroJ.count {
                if zeroI[i] == true || zeroJ[j] == true {
                    matrix[i][j] = 0
                }
            }
        }
    }
}

var matrix: [[Int]] = []
Solution().setZeroes(&matrix)
print(matrix)

matrix = [[]]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [[0]]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [[0, 1]]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [[1]]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [
    [1,1,1],
    [1,0,1],
    [1,1,1]
]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [
    [0,1,2,0],
    [3,4,5,2],
    [1,3,1,5]
]
Solution().setZeroes(&matrix)
print(matrix)

matrix = [
    [3,4,5,2],
    [1,3,1,5],
    [0,1,2,0]
]
Solution().setZeroes(&matrix)
print(matrix)
