/*
 
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 # Example 1:
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 # Example 2:
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 
 Note:
 All given inputs are in lowercase letters a-z.
 
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        if strs.count > 0 {
            var isTheSameChar = true
            for (indexOfChar, char) in strs.first!.enumerated() {
                if isTheSameChar == false {
                    break
                }
                
                for indexOfArray in 1..<strs.count {
                    let str = strs[indexOfArray]
                    if str.count > indexOfChar {
                        let str_Index = str.index(str.startIndex, offsetBy: indexOfChar)
                        if str[str_Index] != char {
                            isTheSameChar = false
                            break
                        }
                    } else {
                        isTheSameChar = false
                        break
                    }
                }
                
                if isTheSameChar {
                    result.append(char)
                }
            }
        }
        
        return result
    }
}

Solution().longestCommonPrefix(["abc","abcd","abcde","ab"])
Solution().longestCommonPrefix(["aca","cba"])
