/*
 
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 
 # Example 1:

 Input:
     matrix = [
       [1,   3,  5,  7],
       [10, 11, 16, 20],
       [23, 30, 34, 50]
     ]
     target = 3
 
 Output: true
 
 # Example 2:

 Input:
     matrix = [
       [1,   3,  5,  7],
       [10, 11, 16, 20],
       [23, 30, 34, 50]
     ]
     target = 13
 
 Output: false
 
 */

class Solution {
    // 64 ms, faster than 100.00%
    // 21.4 MB, less than 100.00%
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else { return false }
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = m * n - 1
        while left <= right {
            let mid = (left + right) / 2
            let i = Int(mid / n) // !!!
            let j = mid % n // !!!
            print("left: \(left), right: \(right), mid: \(mid), i: \(i), j: \(j)")
            let num = matrix[i][j]
            if target < num {
                right = mid - 1
            } else if target > num {
                left = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}

Solution().searchMatrix([[1,3]], 3) // true

Solution().searchMatrix([[1,1]], 2) // false

Solution().searchMatrix([
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
], 3) // true

Solution().searchMatrix([
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
], 13) // false
