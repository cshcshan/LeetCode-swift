/*
 
 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
 
 # Example 1:
 Input: 121
 Output: true
 
 # Example 2:
 Input: -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 # Example 3:
 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 Follow up:
 
 Coud you solve it without converting the integer to a string?
 
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let char_Array = Array(String(describing: x))

        for index in 0..<char_Array.count / 2 {
            if Int(String(describing: char_Array[index])) != Int(String(describing: char_Array[char_Array.count - index - 1])) {
                return false
            }

        }

        return true
    }
}

Solution().isPalindrome(100)
Solution().isPalindrome(1010)
Solution().isPalindrome(10101)
