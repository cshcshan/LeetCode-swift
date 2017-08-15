Int32.min
Int32.max
Int64.min
Int64.max
UInt32.min
UInt32.max

class Solution {
  func reverse(_ x: Int) -> Int {
    guard x != 0 else {
      return 0
    }
    
    let isNegative = x < 0
    let char_Array = String(describing: abs(x)).characters.reversed()
    let string = String(char_Array)
    if var value = Int(string) {
      if isNegative {
        value = value * -1
      }
      guard value <= Int(Int32.max) && value >= Int(Int32.min) else {
        return 0
      }
      return value
    } else {
      return 0
    }
  }
}
Solution().reverse(1534236469)
Solution().reverse(-2147483412)
Solution().reverse(-2147483648)