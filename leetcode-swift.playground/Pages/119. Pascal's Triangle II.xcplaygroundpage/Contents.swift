/*
 
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
 
 Note that the row index starts from 0.
 
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 # Example:
 
 Input: 3
 Output: [1,3,3,1]
 
 Follow up:
 
 Could you optimize your algorithm to use only O(k) extra space?
 
 */

class Solution {
    // 8 ms, faster than 63.81%
    // 20.7 MB, less than 100.00%
//    func getRow(_ rowIndex: Int) -> [Int] {
//        guard rowIndex > 0 else { return [1] }
//        guard rowIndex > 1 else { return [1, 1] }
//        var lastRow: [Int] = [1, 1]
//        for i in 1..<rowIndex {
//            var array = [1]
//            for j in 1...i {
//                array.append(lastRow[j - 1] + lastRow[j])
//            }
//            array.append(1)
//            lastRow = array
//        }
//        return lastRow
//    }
    
    // 4 ms, faster than 93.33%
    // 20.9 MB, less than 100.00%
    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [Int] = [Int](repeatElement(1, count: rowIndex + 1))
        guard rowIndex > 1 else { return result }
        for i in 2...rowIndex {
            for j in stride(from: i - 1, through: 1, by: -1) {
                result[j] += result[j - 1]
            }
        }
        return result
    }
}

Solution().getRow(0)
Solution().getRow(1)
Solution().getRow(2)
Solution().getRow(3)
Solution().getRow(4)
