/*
 
 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 # Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 # Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 
 Note:
 You may assume the string contains only lowercase alphabets.
 
 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 
 */

class Solution {
    // 432 ms, faster than 10.34%
    // 22.2 MB, less than 33.33%
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        guard s.count == t.count else { return false }
//        let sortedS = s.sorted(by: <)
//        let sortedT = t.sorted(by: <)
//        for index in 0..<sortedS.count {
//            if sortedS[index] != sortedT[index] {
//                return false
//            }
//        }
//        return true
//    }
    
    // 2876 ms, faster than 5.17%
    // 21.9 MB, less than 33.33%
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        guard s.count == t.count else { return false }
//        var tempT = Array(t)
//        for sChar in s {
//            for index in stride(from: tempT.count - 1, through: 0, by: -1) {
//                if sChar == tempT[index] {
//                    tempT.remove(at: index)
//                    break
//                }
//            }
//        }
//        return tempT.count == 0 ? true : false
//    }
    
    // 48 ms, faster than 81.35%
    // 22.8 MB, less than 33.33%
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dictionary: [Character: Int] = [:]
        for sChar in s {
            if let count = dictionary[sChar] {
                dictionary[sChar] = count + 1
            } else {
                dictionary[sChar] = 1
            }
        }
        for tChar in t {
            if let count = dictionary[tChar] {
                dictionary[tChar] = count - 1
            } else {
                return false
            }
        }
        for (_, item) in dictionary.enumerated() {
            if item.value > 0 {
                return false
            }
        }
        return true
    }
}

Solution().isAnagram("a", "b") // false
Solution().isAnagram("anagram", "nagaram") // true
Solution().isAnagram("rat", "car") // false
