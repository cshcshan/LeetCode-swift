/*
 
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 Example 1:
 Input:
 [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 Input:
 [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 */

class Solution {
    // 4 ms, faster than 90.26%
    // 20.8 MB, less than 100.00%
//    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//        guard matrix.count > 0 else { return [] }
//        guard matrix.count > 1 else { return matrix[0] }
//        guard matrix[0].count > 0 else { return matrix[0] }
//
//        var result: [Int] = []
//        // order of direction: right(j+1), down(i+1), left(j-1), up(i-1)
//        // 0 = right, 1 = down, 2 = left, 3 = up
//        var orderOfDirection = 0
//        var mark: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
//
//        var i = 0
//        var j = 0
//        result.append(matrix[i][j])
//        mark[i][j] = -1
//
//        var obstacle = 0
//
//        while obstacle < 2 {
//            switch orderOfDirection {
//            case 0: // right
//                if rightCheck(&mark, i: i, j: &j) {
//                    obstacle = 0
//                    update(matrix, mark: &mark, i: i, j: j, result: &result)
//                } else {
//                    orderOfDirection = (orderOfDirection + 1) % 4
//                    obstacle += 1
//                }
//            case 1: // down
//                if downCheck(&mark, i: &i, j: j) {
//                    obstacle = 0
//                    update(matrix, mark: &mark, i: i, j: j, result: &result)
//                } else {
//                    orderOfDirection = (orderOfDirection + 1) % 4
//                    obstacle += 1
//                }
//            case 2: // left
//                if leftCheck(&mark, i: i, j: &j) {
//                    obstacle = 0
//                    update(matrix, mark: &mark, i: i, j: j, result: &result)
//                } else {
//                    orderOfDirection = (orderOfDirection + 1) % 4
//                    obstacle += 1
//                }
//            case 3: // up
//                if upCheck(&mark, i: &i, j: j) {
//                    obstacle = 0
//                    update(matrix, mark: &mark, i: i, j: j, result: &result)
//                } else {
//                    orderOfDirection = (orderOfDirection + 1) % 4
//                    obstacle += 1
//                }
//            default: break
//            }
//        }
//
//        return result
//    }
//
//    private func rightCheck(_ mark: inout [[Int]], i: Int, j: inout Int) -> Bool {
//        let newJ = j + 1
//        guard newJ < mark[i].count && mark[i][newJ] == 0 else { return false }
//        j = newJ
//        return true
//    }
//
//    private func downCheck(_ mark: inout [[Int]], i: inout Int, j: Int) -> Bool {
//        let newI = i + 1
//        guard newI < mark.count && mark[newI][j] == 0 else { return false }
//        i = newI
//        return true
//    }
//
//    private func leftCheck(_ mark: inout [[Int]], i: Int, j: inout Int) -> Bool {
//        let newJ = j - 1
//        guard newJ >= 0 && mark[i][newJ] == 0 else { return false }
//        j = newJ
//        return true
//    }
//
//    private func upCheck(_ mark: inout [[Int]], i: inout Int, j: Int) -> Bool {
//        let newI = i - 1
//        guard newI >= 0 && mark[newI][j] == 0 else { return false }
//         i = newI
//        return true
//    }
//
//    private func update(_ matrix: [[Int]], mark: inout [[Int]], i: Int, j: Int, result: inout [Int]) {
//        result.append(matrix[i][j])
//        mark[i][j] = -1
//    }
    
    // 0 ms, faster than 100.00%
    // 20.9 MB, less than 100.00%
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return [] }
        guard matrix.count > 1 else { return matrix[0] }
        guard matrix[0].count > 0 else { return matrix[0] }
        
        var result: [Int] = []
        
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        
        while left <= right && top <= bottom {
            // right
            for index in left...right {
                result.append(matrix[top][index])
            }
            top += 1
            
            guard left <= right && top <= bottom else { break }
            
            // down
            for index in top...bottom {
                result.append(matrix[index][right])
            }
            right -= 1
            
            guard left <= right && top <= bottom else { break }
            
            // left
            for index in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][index])
            }
            bottom -= 1
            
            guard left <= right && top <= bottom else { break }
            
            // up
            for index in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[index][left])
            }
            left += 1
        }
        
        return result
    }
}

Solution().spiralOrder([[]])

Solution().spiralOrder([[0]])

Solution().spiralOrder([[1,2,3]])

Solution().spiralOrder(
    [
        [ 1, 2, 3 ],
        [ 4, 5, 6 ],
        [ 7, 8, 9 ]
    ]
) // [1,2,3,6,9,8,7,4,5]

Solution().spiralOrder(
    [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9,10,11,12]
    ]
) // [1,2,3,4,8,12,11,10,9,5,6,7]
