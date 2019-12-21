/*
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

 Example:

 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 
 */

class Solution {
    // 8 ms, faster than 63.19%
    // 20.9 MB, less than 25.00%
    func letterCombinations(_ digits: String) -> [String] {
        let number_letter = ["2": ["a", "b", "c"],
                             "3": ["d", "e", "f"],
                             "4": ["g", "h", "i"],
                             "5": ["j", "k", "l"],
                             "6": ["m", "n", "o"],
                             "7": ["p", "q", "r", "s"],
                             "8": ["t", "u", "v"],
                             "9": ["w", "x", "y", "z"]]
        var result: [String] = []
        for digit in digits {
            guard let letters = number_letter[String(digit)] else { continue }
            if result.count == 0 {
                result = letters
            } else {
                var tempResult: [String] = []
                for str in result {
                    for letter in letters {
                        tempResult.append("\(str)\(letter)")
                    }
                }
                result = tempResult
            }
        }
        return result
    }
}

Solution().letterCombinations("23") // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
