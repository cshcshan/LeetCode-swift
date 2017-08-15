class Solution {
  func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    if strs.count > 0 {
      var isTheSameChar = true
      for (indexOfChar, char) in strs.first!.characters.enumerated() {
        if isTheSameChar == false {
          break
        }
        
        for indexOfArray in 1..<strs.count {
          let str = strs[indexOfArray]
          if str.characters.count > indexOfChar {
            let str_Index = str.characters.index(str.startIndex, offsetBy: indexOfChar)
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
