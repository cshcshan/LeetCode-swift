/*
 
 Given an integer, write a function to determine if it is a power of three.

 # Example 1:

 Input: 27
 Output: true
 
 # Example 2:

 Input: 0
 Output: false
 
 # Example 3:

 Input: 9
 Output: true
 
 # Example 4:

 Input: 45
 Output: false
 
 Follow up:
 Could you do it without using any loop / recursion?
 
 (n 是不是3的次方)
 */

class Solution {
    // 60 ms, faster than 40.19%
    // 21.1 MB, less than 100.00%
//    func isPowerOfThree(_ n: Int) -> Bool {
//        guard n > 0 else { return false }
//        guard n > 1 else { return true }
//        var remainder = n % 3
//        var quotient = n / 3
//        while remainder == 0 {
//            if quotient == 1 {
//                return true
//            }
//            remainder = quotient % 3
//            quotient = quotient / 3
//        }
//        return false
//    }
    
    // Iterative Solution
    // 48 ms, faster than 87.85%
    // 21.4 MB, less than 100.00%
//    func isPowerOfThree(_ n: Int) -> Bool {
//        var n = n
//        if n > 1 {
//            while n % 3 == 0 {
//                n /= 3
//            }
//        }
//        return n == 1
//    }
    
    // Recursive Solution
    // 44 ms, faster than 94.39%
    // 21.3 MB, less than 100.00%
//    func isPowerOfThree(_ n: Int) -> Bool {
//        return n > 0 && (n == 1 || (n % 3 == 0) && isPowerOfThree(n / 3))
//    }
    
    // No Loop / Recursion Solution
    // 56 ms, faster than 60.75%
    // 21.1 MB, less than 100.00%
    func isPowerOfThree(_ n: Int) -> Bool {
        /*
         3^19 為 1,162,261,467 , 再過來 3^20 = 3,486,784,401 已經超出 Int 的最大範圍 (2,147,483,647)。
         所以只要 n > 0 且能被 3^19 整除就是 3 的次方數。
         */
        return n > 0 && 1162261467 % n == 0
    }
}

Solution().isPowerOfThree(27) // true
Solution().isPowerOfThree(0) // false
Solution().isPowerOfThree(9) // true
Solution().isPowerOfThree(45) // false
Solution().isPowerOfThree(-27) // false
Solution().isPowerOfThree(1) // true
