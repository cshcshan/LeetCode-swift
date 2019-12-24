/*
 
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

 # Example 1:

 Input: n = 12
 Output: 3
 
 Explanation: 12 = 4 + 4 + 4.
 
 # Example 2:

 Input: n = 13
 Output: 2
 
 Explanation: 13 = 4 + 9.
 
 (204. Count Primes)
 */

import Foundation

class Solution {
    // !!!
    // 4 ms, faster than 98.86%
    // 20.5 MB, less than 33.33%
    func numSquares(_ n: Int) -> Int {
        // 每個正整數都可以表示為 4 個以內個整數的平方和
        
        var n = n
        // 如果一個數是 4 的倍數，那我們可以把 4 除掉，並不影響結果
//        while n % 4 == 0 {
//            n /= 4
//        }
        while n & 3 == 0 {
            n >>= 2
        }
        // 一個數 % 8 = 7，那他絕對是 4 個完全平方數組成
        if n % 8 == 7 {
            return 4
        }
        // 如果一個數由 2 個平方數組成，如果其中一個平方數是 0，那 return 1，否則就是 2
        var index = Int(sqrt(Double(n))) // 求 n 的平方根整數部分
        while index > 0 {
            let tmp = Double(n - index * index)
            let sqrtTmp = Int(sqrt(tmp))
            if n == sqrtTmp * sqrtTmp + index * index {
                return sqrtTmp == 0 ? 1 : 2
            }
            index -= 1
        }
        return 3
    }
    
    // !!! Dynamic Programming
    // 600 ms, faster than 40.91%
    // 21.3 MB, less than 33.33%
//    func numSquares(_ n: Int) -> Int {
//        guard n > 0 else { return 0 }
//        // dp[i] = the least number of perfect square numbers which sum to i.
//        // Note that dp[0] is 0.
//        var dp = [Int](repeating: Int.max, count: n + 1)
//        dp[0] = 0
//        for i in 1...n {
//            // For each i, it must be the sum of some number (i - j * j)
//            // and a perfect square number (j * j).
//            for j in 1...Int(sqrt(Double(i))) {
//                if i - j * j < dp.count {
//                    dp[i] = min(dp[i], dp[i - j * j] + 1)
//                }
//            }
//        }
////        print(dp)
//        return dp.last ?? 0
//    }
}

Solution().numSquares(48) // 3
Solution().numSquares(12) // 3
Solution().numSquares(13) // 2
Solution().numSquares(99) // 3
Solution().numSquares(100) // 1
