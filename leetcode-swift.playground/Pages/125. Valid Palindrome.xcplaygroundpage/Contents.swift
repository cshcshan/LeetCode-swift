/*
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 # Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 
 # Example 2:

 Input: "race a car"
 Output: false
 
 */

class Solution {
    // 44 ms, faster than 56.63%
    // 21.7 MB, less than 50.00%
//    func isPalindrome(_ s: String) -> Bool {
//        var strs: [Character] = []
//        for char in s {
//            let low = Character(char.lowercased())
//            if let ascii = low.asciiValue {
//                if 97...122 ~= ascii || 48...57 ~= ascii {
//                    strs.append(low)
//                }
//            }
//        }
//        for index in 0..<strs.count/2 {
//            if strs[index] != strs[(strs.count - 1) - index] {
//                return false
//            }
//        }
//        return true
//    }
    
    // 64 ms, faster than 40.45%
    // 21.4 MB, less than 50.00%
    func isPalindrome(_ s: String) -> Bool {
        let sArray = Array(s)
        var left = 0
        var right = sArray.count - 1
        while left <= right {
            while left < right && !isAlphanumeric(sArray[left]) {
                left += 1
            }
            while left < right && !isAlphanumeric(sArray[right]) {
                right -= 1
            }
            if sArray[left].lowercased() != sArray[right].lowercased() {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    private func isAlphanumeric(_ c: Character) -> Bool {
        guard let ascii = c.asciiValue else { return false }
        return 65...90 ~= ascii || 97...122 ~= ascii || 48...57 ~= ascii
    }
}

Solution().isPalindrome("0P") // false
Solution().isPalindrome("A man, a plan, a canal: Panama") // true
Solution().isPalindrome("race a car") // false
