/*
 
 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 
 Example:
 Input: 3
 Output:
 [
    [ 1, 2, 3 ],
    [ 8, 9, 4 ],
    [ 7, 6, 5 ]
 ]
 
 */

class Solution {
    // 8 ms, faster than 70.59%
    // 21 MB, less than 100.00%
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var val = 1
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = n - 1
        while top <= bottom && left <= right {
            // right
            for index in left...right {
                result[top][index] = val
                val += 1
            }
            top += 1
            guard top <= bottom && left <= right else { break }
            
            // down
            for index in top...bottom {
                result[index][right] = val
                val += 1
            }
            right -= 1
            guard top <= bottom && left <= right else { break }
            
            // left
            for index in stride(from: right, through: left, by: -1) {
                result[bottom][index] = val
                val += 1
            }
            bottom -= 1
            guard top <= bottom && left <= right else { break }
            
            // up
            for index in stride(from: bottom, through: top, by: -1) {
                result[index][left] = val
                val += 1
            }
            left += 1
        }
        return result
    }
}

Solution().generateMatrix(3)

/*
 
 [
    [ 1, 2, 3 ],
    [ 8, 9, 4 ],
    [ 7, 6, 5 ]
 ]
 
 */
