/*
 
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Note:
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 # Example 1:
 
 Given input matrix =
 [
    [1,2,3],
    [4,5,6],
    [7,8,9]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
    [7,4,1],
    [8,5,2],
    [9,6,3]
 ]
 
 # Example 2:
 
 Given input matrix =
 [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
    [15,13, 2, 5],
    [14, 3, 4, 1],
    [12, 6, 8, 9],
    [16, 7,10,11]
 ]
 
 */

class Solution {
//    func rotate(_ matrix: inout [[Int]]) {
//        /*
//
//         第一列(row)的數字會變成最後一欄(col)的數字
//         第二列(row)的數字會變成島倒數第二欄(col)的數字
//         因此 new x = y, new y = (R - x)
//
//         */
//        var result = matrix
//        var newX = 0
//        var newY = 0
//        for i in 0..<matrix.count {
//            for j in 0..<matrix.count {
//                print("i: \(i), j: \(j), value: \(matrix[i][j])")
//                newX = j
//                newY = (matrix.count - 1) - i
//                result[newX][newY] = matrix[i][j]
//            }
//        }
//        matrix = result
//    }
    
    // *** 8 ms, faster than 99.63% ***
    // *** 21 MB, less than 100.00% ***
    func rotate(_ matrix: inout [[Int]]) {
        /*
         
         第一列(row)的數字會變成最後一欄(col)的數字
         第二列(row)的數字會變成島倒數第二欄(col)的數字
         因此 new x = y, new y = (R - x)
         
         */
        
        let mid = Int(matrix.count/2)
        for i in mid..<matrix.count {
            if matrix.count % 2 == 1 && i == mid {
                // 若碰到中心軸時，只要處理一次就好，不然會出錯
                continue
            }
            for j in mid..<matrix.count {
                var nextX = j
                var nextY = (matrix.count - 1) - i
                while (i != nextX || j != nextY) {
                    let temp = matrix[nextX][nextY]
                    matrix[nextX][nextY] = matrix[i][j]
                    matrix[i][j] = temp
                    let tempX = nextX
                    let tempY = nextY
                    nextX = tempY
                    nextY = (matrix.count - 1) - tempX
                }
            }
        }
    }
}

var matrix =
    [
        [1,2,3],
        [4,5,6],
        [7,8,9]
]
Solution().rotate(&matrix)

/*
 [
    [7,4,1],
    [8,5,2],
    [9,6,3]
 ]
 */

matrix =
    [
        [ 5, 1, 9,11],
        [ 2, 4, 8,10],
        [13, 3, 6, 7],
        [15,14,12,16]
]
Solution().rotate(&matrix)

/*
 
 [
    [15,13, 2, 5],
    [14, 3, 4, 1],
    [12, 6, 8, 9],
    [16, 7,10,11]
 ]
 
 */

matrix = [[]]
Solution().rotate(&matrix)
