/*
 
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
 # Example 1:
 Input: 2
 Output: [0,1,1]
 
 # Example 2:
 Input: 5
 Output: [0,1,1,2,1,2]
 
 Follow up:
 
 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 
 */

class Solution {
    // 88 ms, faster than 21.69%
    // 24.7 MB, less than 100.00%
//    func countBits(_ num: Int) -> [Int] {
//        var result: [Int] = []
//        for index in 0...num {
//            result.append(getBits(num: index))
//        }
//        return result
//    }
//
//    private func getBits(num: Int) -> Int {
//        guard num > 0 else { return 0 }
//        var result = 0
//        var n = num
//        var quotient = n / 2
//        var remainder = n % 2
//        if remainder == 1 {
//            result += 1
//        }
//        while quotient > 0 {
//            n = quotient
//            quotient = n / 2
//            remainder = n % 2
//            if remainder == 1 {
//                result += 1
//            }
//        }
//        if result == 0 { // is power of 2
//            result += 1
//        }
//        return result
//    }
    
    /* (從2開始)
     2的次方數他必定只有用一個1，因此以2次方數為一個區間
     index減掉最接近但不大於的2次方數後
     那個值使用1的數量+1就是index使用1的數量
     */
    // 80 ms, faster than 27.71%
    // 26.4 MB, less than 100.00%
//    func countBits(_ num: Int) -> [Int] {
//        guard num > 0 else { return [0] }
//        guard num > 1 else { return [0, 1] }
//        var result: [Int] = [0, 1]
//        var dict: [Int: Int] = [0:0, 1:1]
//        var powerOf2 = 1
//        for index in 2...num {
//            let differ = index - powerOf2
//            if differ == powerOf2 {
//                powerOf2 *= 2
//                result.append(1)
//                dict[index] = 1
//            } else {
//                let valOfDiffer = dict[differ]!
//                let valOfIndex = valOfDiffer + 1
//                result.append(valOfIndex)
//                dict[index] = valOfIndex
//            }
//        }
//        return result
//    }
    
    /* (從1開始)
     index為偶數時，index/2 得到的值所使用1的數量會和 index 所使用1的數量一樣
     index為奇數時，index/2 得到的值所使用1的數量+1會和 index 所使用1的數量一樣
     */
    // 88 ms, faster than 21.69%
    // 26 MB, less than 100.00%
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var result: [Int] = [0]
        var dict: [Int: Int] = [0:0]
        for index in 1...num {
            let quotient: Int = index / 2
            var valOfIndex: Int = dict[quotient]!
            if index % 2 == 1 {
                valOfIndex += 1
            }
            dict[index] = valOfIndex
            result.append(valOfIndex)
        }
        return result
    }
}

Solution().countBits(0)
Solution().countBits(1)
Solution().countBits(2)  // [0,1,1]
Solution().countBits(5)  // [0,1,1,2,1,2]
Solution().countBits(16) // [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1]
Solution().countBits(1000)
