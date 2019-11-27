/*

 Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 
 # Example 1:
 
 Input: a = 1, b = 2
 Output: 3
 
 # Example 2:
 
 Input: a = -2, b = 3
 Output: 1
 
 */
class Solution {
    // !!!
    // 4 ms, faster than 83.91%
    // 20.6 MB, less than 100.00%
    /*
     加法運算步驟：
     1. a = x ^ y
     2. b = (x & y) << 1
     3. 如果 b = 0，則 a 就是結果；如果 b != 0，則 a + b (繼續回到步驟1)就是結果
     */
    func getSum(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else { return a }
        let xorResult = a ^ b
        let andResult = (a & b) << 1
        return getSum(xorResult, andResult)
    }
}

Solution().getSum(1, 2) // 3
Solution().getSum(-2, 3) // 1
Solution().getSum(101, -2) // 99
Solution().getSum(0, 0) // 0
