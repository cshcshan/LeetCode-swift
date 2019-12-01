/*
 
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 # Example 1:

 Input: "()"
 Output: true
 
 # Example 2:

 Input: "()[]{}"
 Output: true
 
 # Example 3:

 Input: "(]"
 Output: false
 
 # Example 4:

 Input: "([)]"
 Output: false
 
 # Example 5:

 Input: "{[]}"
 Output: true
 
 */

class Solution {
    // 8 ms, faster than 75.18%
    // 20.9 MB, less than 14.29%
//    func isValid(_ s: String) -> Bool {
//        var stack: [String.Element] = []
//        for char in s {
//            switch char {
//            case "(", "{", "[":
//                stack.append(char)
//            case ")":
//                if stack.isEmpty {
//                    return false
//                }
//                if stack.removeLast() != "(" {
//                    return false
//                }
//            case "}":
//                if stack.isEmpty {
//                    return false
//                }
//                if stack.removeLast() != "{" {
//                    return false
//                }
//            case "]":
//                if stack.isEmpty {
//                    return false
//                }
//                if stack.removeLast() != "[" {
//                    return false
//                }
//            default: break
//            }
//        }
//        return stack.isEmpty
//    }
    
    // 8 ms, faster than 75.18%
    // 20.8 MB, less than 14.29%
    func isValid(_ s: String) -> Bool {
        var stack: [String.Element] = []
        let dict: [String.Element: String.Element] = [")":"(", "}":"{", "]":"["]
        for char in s {
            if let val = dict[char] {
                if stack.isEmpty {
                    return false
                }
                if stack.removeLast() != val {
                    return false
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}

Solution().isValid("(")
Solution().isValid(")")
Solution().isValid("()")
Solution().isValid("()[]{}")
Solution().isValid("(]")
Solution().isValid("([)]")
Solution().isValid("{[]}")
