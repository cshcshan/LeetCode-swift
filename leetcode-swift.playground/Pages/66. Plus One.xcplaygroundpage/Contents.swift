/*
 
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 # Example 1:
 
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 # Example 2:
 
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 
 */

class Solution {
    // 8 ms, faster than 75.87%
    // 20.8 MB, less than 20.00%
    func plusOne(_ digits: [Int]) -> [Int] {
        var newDigits = digits
        var index = digits.count - 1
        newDigits[index] += 1
        while index >= 0 && newDigits[index] > 9 {
            newDigits[index] = newDigits[index] % 10
            index -= 1
            if index >= 0 {
                newDigits[index] += 1
            } else {
                newDigits.insert(1, at: 0)
            }
        }
        return newDigits
    }
}

Solution().plusOne([9])
Solution().plusOne([9,9])
Solution().plusOne([1,9,9])
Solution().plusOne([1,0,9,9])
Solution().plusOne([1,2,3]) // [1,2,4]
Solution().plusOne([4,3,2,1]) // [4,3,2,2]
