/*
 
 Write a function that reverses a string. The input string is given as an array of characters char[].
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 You may assume all the characters consist of printable ascii characters.
 
 
 
 # Example 1:
 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 
 # Example 2:
 Input: ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
 
 */

class Solution {
    // 300 ms, faster than 17.58%
    // 24.6 MB, less than 25.00%
//    func reverseString(_ s: inout [Character]) {
//        guard s.count > 0 else { return }
//        var leftIndex = 0
//        var rightIndex = s.count - 1
//
//        while leftIndex < rightIndex {
//            let temp = s[leftIndex]
//            s[leftIndex] = s[rightIndex]
//            s[rightIndex] = temp
//            leftIndex += 1
//            rightIndex -= 1
//        }
//    }
    
    // 280 ms, faster than 63.31%
    // 24.7 MB, less than 25.00%
//    func reverseString(_ s: inout [Character]) {
//        guard s.count > 0 else { return }
//        for index in 0..<s.count/2 {
//            let temo = s[index]
//            s[index] = s[s.count - 1 - index]
//            s[s.count - 1 - index] = temo
//        }
//    }
    
    // 308 ms, faster than 11.77%
    // 24.6 MB, less than 25.00%
    func reverseString(_ s: inout [Character]) {
        guard s.count > 0 else { return }
        for index in 0..<s.count/2 {
            s.swapAt(index, s.count - 1 - index)
        }
    }
}

var array: [Character] = ["h","e","l","l","o"]
Solution().reverseString(&array) // ["o","l","l","e","h"]
array = ["H","a","n","n","a","h"]
Solution().reverseString(&array) // ["h","a","n","n","a","H"]
array = ["a","b","c","d","e"]
Solution().reverseString(&array)
array = ["a","b","c","d","e","f"]
Solution().reverseString(&array)
