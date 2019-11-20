/*
 
 Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.
 
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 
 # Example:
 
 matrix = [
    [ 1,  5,  9],
    [10, 11, 13],
    [12, 13, 15]
 ],
 k = 8,
 
 return 13.
 
 */

class Solution {
    // 320 ms, faster than 77.08%
    // 21.8 MB, less than 100.00%
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        guard k > 0 else { return -1 }
        guard matrix.count > 0 else { return -1 }
        var array: [Int] = []
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                array.append(matrix[i][j])
            }
        }
        array = array.sorted(by:<)
        return array[k-1]
    }
}

Solution().kthSmallest([
    [ 1,  5,  9],
    [10, 11, 13],
    [12, 13, 15]
    ], 8) // 13
