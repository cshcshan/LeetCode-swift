Int32.min
Int32.max
Int64.min
Int64.max
UInt32.min
UInt32.max

/*
 
 Given a 32-bit signed integer, reverse digits of an integer.
 
 # Example 1:
 Input: 123
 Output: 321
 
 # Example 2:
 Input: -123
 Output: -321
 
 # Example 3:
 Input: 120
 Output: 21
 
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        guard x != 0 else {
            return 0
        }
        
        let isNegative = x < 0
        let char_Array = String(describing: abs(x)).reversed()
        let string = String(char_Array)
        if var value = Int(string) {
            if isNegative {
                value = value * -1
            }
            guard value <= Int(Int32.max) && value >= Int(Int32.min) else {
                return 0
            }
            return value
        } else {
            return 0
        }
    }
}

Solution().reverse(1534236469)
Solution().reverse(-2147483412)
Solution().reverse(-2147483648)
