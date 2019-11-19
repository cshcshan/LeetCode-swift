/*
 
 Implement int sqrt(int x).
 
 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 
 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 
 # Example 1:
 
 Input: 4
 Output: 2
 
 # Example 2:
 
 Input: 8
 Output: 2
 
 Explanation: The square root of 8 is 2.82842..., and since
 the decimal part is truncated, 2 is returned.

 */

class Solution {
    // 8 ms, faster than 79.70%
    // 20.6 MB, less than 100.00%
//    func mySqrt(_ x: Int) -> Int {
//        guard x != 1 else { return 1 }
//        var left = 0
//        var right = x
//        var mid = (left + right) / 2
//        while (left + 1 != right) && (mid * mid != x) {
//            if mid * mid > x {
//                right = mid
//            } else {
//                left = mid
//            }
//            mid = (left + right) / 2
//        }
//        if mid * mid == x {
//            return mid
//        }
//        return left
//    }
    
    // !!! 牛頓迭代法
    // 8 ms, faster than 79.70%
    // 20.5 MB, less than 100.00%
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        let right: Double = Double(x)
        let mid = right / 2
        var y: Double = (mid > 1) ? mid : 1
        while true {
            let dy: Double = (y * y + right) / (y * 2)
            if abs(y - dy) <= 0.01 {
                return Int(dy)
            } else {
                y = dy
            }
        }
    }
}

for index in 0...4 {
    let sqrt = Solution().mySqrt(index)
    print("\(index)'s sqrt is \(sqrt)")
}

for index in 8...16 {
    let sqrt = Solution().mySqrt(index)
    print("\(index)'s sqrt is \(sqrt)")
}
