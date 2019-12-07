/*
 
 Implement pow(x, n), which calculates x raised to the power n (xn).

 # Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 
 # Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 
 # Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 
 */

class Solution {
    // !!!
    /*
     3^20 = (3^10)^2
     3^9 = (3^4)^2 * 3
     */
    // 4 ms, faster than 91.61%
    // 21 MB, less than 33.33%
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard x != 0 else { return 0 }
        guard n != 0 else { return 1 }
        var result: Double = 0
        var base: Double = x
        var power: Int = n
        if power < 0 {
            power = -power
            base = 1 / base
        }
        if power % 2 == 0 {
            result = myPow(base * base, Int(power / 2))
        } else {
            result = myPow(base * base, Int(power / 2)) * base
        }
        return result
    }
}

//Solution().myPow(2.00000, 10) // 1024.00000
//Solution().myPow(2.10000, 3) // 9.26100
Solution().myPow(2.00000, -2) // 0.25000
Solution().myPow(2.00000, -3) // 0.25000
