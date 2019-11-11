/*
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 
  A -> 1
  B -> 2
  C -> 3
 ...
  Z -> 26
 AA -> 27
 AB -> 28
 ...
 
 # Example 1:
 
 Input: "A"
 Output: 1
 
 # Example 2:
 
 Input: "AB"
 Output: 28
 
 # Example 3:
 
 Input: "ZY"
 Output: 701
 
 */

class Solution {
    // 8 ms, faster than 88.39%
    // 21 MB, less than 12.50%
//    func titleToNumber(_ s: String) -> Int {
//        // 26 進位轉 10 進位
//        guard s.count > 0 else { return 0 }
//        var result = 0
//        let array = Array(s.uppercased())
//        for index in stride(from: array.count - 1, through: 0, by: -1) {
//            let char = array[index]
//            if let ascii = char.asciiValue {
//                let value = Int(ascii - 64) // 65-90 [A-Z]
//                result += value * pow(base: 26, power: array.count - 1 - index)
//            }
//        }
//        return result
//    }
//
//    private func pow(base: Int, power: Int) -> Int {
//        guard power > 0 else { return 1 }
//        var result = 1
//        for _ in 0..<power {
//            result *= base
//        }
//        return result
//    }
    
    // 12 ms, faster than 55.36%
    // 20.5 MB, less than 12.50%
    func titleToNumber(_ s: String) -> Int {
        // 26 進位轉 10 進位
        guard s.count > 0 else { return 0 }
        var result = 0
        let asciiOfA = Character("A").asciiValue! // 65
        let array = Array(s.uppercased())
        for index in 0..<array.count {
            let char = array[index]
            if let ascii = char.asciiValue {
                let value = Int(ascii - (asciiOfA - 1))
                result += value * pow(base: 26, power: array.count - 1 - index)
            }
        }
        return result
    }
    
    private func pow(base: Int, power: Int) -> Int {
        guard power > 0 else { return 1 }
        var result = 1
        for _ in 0..<power {
            result *= base
        }
        return result
    }
}

Solution().titleToNumber("A") // 1
Solution().titleToNumber("B") // 2
Solution().titleToNumber("C") // 3
Solution().titleToNumber("Z") // 26
Solution().titleToNumber("AA") // 27
Solution().titleToNumber("AB") // 28
Solution().titleToNumber("ZY") // 701
Solution().titleToNumber("AAA") // 703
