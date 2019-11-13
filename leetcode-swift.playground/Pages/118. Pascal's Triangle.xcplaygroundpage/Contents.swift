/*
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 # Example:
 
 Input: 5
 Output:
 [
        [1],
       [1,1],
      [1,2,1],
     [1,3,3,1],
    [1,4,6,4,1]
 ]

 */

class Solution {
    // 8 ms, faster than 57.69%
    // 20.9 MB, less than 100.00%
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        guard numRows > 1 else { return [[1]] }
        guard numRows > 2 else { return [[1], [1, 1]] }
        var result = [[1], [1, 1]]
        var lastRow = [1, 1]
        for i in 2..<numRows {
            var array = [1]
            for j in 1..<i {
                // array[1] = lastRow[0] + lastRow[1]
                // array[2] = lastRow[1] + lastRow[2]
                // array[3] = lastRow[2] + lastRow[3]
                array.append(lastRow[j - 1] + lastRow[j])
            }
            array.append(1)
            result.append(array)
            lastRow = array
        }
        return result
    }
}

Solution().generate(5)
