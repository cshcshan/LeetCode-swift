/*
 
 Given a string, sort it in decreasing order based on the frequency of characters.
 
 # Example 1:
 
 Input:
 "tree"
 
 Output:
 "eert"
 
 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 
 # Example 2:
 
 Input:
 "cccaaa"
 
 Output:
 "cccaaa"
 
 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.
 
 # Example 3:
 
 Input:
 "Aabb"
 
 Output:
 "bbAa"
 
 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 
 Note that 'A' and 'a' are treated as two different characters.
 
 */

class Solution {
    // !!!
    // 360 ms, faster than 6.25%
    // 24 MB, less than 100.00%
//    func frequencySort(_ s: String) -> String {
//        guard s.count > 0 else { return "" }
//        var result = ""
//        let array = Array(s)
//        var dictionary: [Character: Int] = [:]
//        for index in 0..<array.count {
//            let char = array[index]
//            if let count = dictionary[char] {
//                dictionary[char] = count + 1
//            } else {
//                dictionary[char] = 1
//            }
//        }
//        let sortedArray = dictionary.sorted(by: { $0.value > $1.value })
//        for item in sortedArray {
//            for _ in 0..<item.value {
//                result = "\(result)\(item.key)"
//            }
//        }
//        return result
//    }
    
    // 104 ms, faster than 68.75%
    // 23.5 MB, less than 100.00%
    func frequencySort(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var result = ""
        let array = Array(s)
        var dictionary: [Character: Int] = [:]
        for index in 0..<array.count {
            let char = array[index]
            if let count = dictionary[char] {
                dictionary[char] = count + 1
            } else {
                dictionary[char] = 1
            }
        }
        let sortedArray = dictionary.sorted(by: { $0.value > $1.value })
        for item in sortedArray {
            result += String(repeating: item.key, count: item.value)
        }
        return result
    }
}

Solution().frequencySort("a")
Solution().frequencySort("Aa")
Solution().frequencySort("tree") // eert, eetr
Solution().frequencySort("cccaaa") // cccaaa, aaaccc
Solution().frequencySort("Aabb") // bbAa, bbaA
