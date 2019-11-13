/*
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 # Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 
 Note: You may assume the string contain only lowercase letters.
 
 */

class Solution {
    // 420 ms, faster than 20.36%
    // 23.5 MB, less than 50.00%
//    func firstUniqChar(_ s: String) -> Int {
//        guard s.count > 0 else { return -1 }
//        let array = Array(s)
//        var dictionary: [Character: [Int]] = [:]
//        var result = array.count
//        for index in 0..<array.count {
//            let char = array[index]
//            var positions = dictionary[char]
//            if positions == nil {
//                dictionary[char] = [index]
//            } else {
//                positions!.append(index)
//                dictionary[char] = positions
//            }
//        }
//        for (_, item) in dictionary.enumerated() {
//            if item.value.count == 1 {
//                result = min(result, item.value[0])
//            }
//        }
//        return result == array.count ? -1 : result
//    }
    
    // 144 ms, faster than 93.73%
    // 21.2 MB, less than 50.00%
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else { return -1 }
        var freq = [Int](repeating: 0, count: 26)
        let array = Array(s)
        let asciiBase = Character("a").asciiValue!
        for index in 0..<array.count {
            if let ascii = array[index].asciiValue {
                let position = Int(ascii - asciiBase)
                freq[position] += 1
            }
        }
        for index in 0..<array.count {
            if let ascii = array[index].asciiValue {
                let position = Int(ascii - asciiBase)
                if freq[position] == 1 {
                    return index
                }
            }
        }
        return -1
    }
}

Solution().firstUniqChar("cc") // -1
Solution().firstUniqChar("cca") // 2
Solution().firstUniqChar("leetcode") // 0
Solution().firstUniqChar("loveleetcode") // 2
