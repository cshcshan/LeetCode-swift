/*
 
 Given an integer n, return the number of trailing zeroes in n!.

 # Example 1:

 Input: 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.
 
 # Example 2:

 Input: 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.
 
 Note: Your solution should be in logarithmic time complexity.

 */

class Solution {
    // !!!
    // 4 ms, faster than 89.06%
    // 20.7 MB, less than 100.00%
    func trailingZeroes(_ n: Int) -> Int {
        return n == 0 ? 0 : n / 5 + trailingZeroes(n / 5)
    }
}

Solution().trailingZeroes(3) // 0
Solution().trailingZeroes(5) // 1
Solution().trailingZeroes(10) // 2
Solution().trailingZeroes(15) // 3
Solution().trailingZeroes(20) // 4
Solution().trailingZeroes(25) // 6 (15511210043330985984000000)
/*
 !!!
 25! 因為本身還多了一個 5 (25 = 5 * 5)，所以要 +1
 */
Solution().trailingZeroes(30) // 7
