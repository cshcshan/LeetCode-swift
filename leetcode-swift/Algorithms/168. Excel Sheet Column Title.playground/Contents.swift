import Foundation

class Solution {
  func convertToTitle(_ n: Int) -> String {
    return recursive(n, result: "")
  }
  
  func recursive(_ n: Int, result: String) -> String {
    var str = result
    let target = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let targetCount = target.characters.count
    let remainder = (n - 1) % targetCount
    var remainder_String = ""
    remainder_String = target.substring(with: target.index(target.startIndex, offsetBy: remainder)..<target.index(target.startIndex, offsetBy: remainder + 1))
    let quotient = Int((n - 1) / targetCount)
    str = "\(remainder_String)\(result)"
    if quotient > 0 {
      return "\(recursive(quotient, result: str))"
    } else {
      return str
    }
  }
}
Solution().convertToTitle(1)
Solution().convertToTitle(23)
Solution().convertToTitle(25)
Solution().convertToTitle(26)
Solution().convertToTitle(51)
Solution().convertToTitle(120)
Solution().convertToTitle(1200)