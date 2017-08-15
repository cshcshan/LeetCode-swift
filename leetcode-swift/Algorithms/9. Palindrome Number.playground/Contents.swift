class Solution {
  func isPalindrome(_ x: Int) -> Bool {
    
    let char_Array = String(describing: x).characters.filter { (char) -> Bool in
      return true
    }
    
    for index in 0..<char_Array.count / 2 {
      
      if Int(String(describing: char_Array[index])) != Int(String(describing: char_Array[char_Array.count - index - 1])) {
        return false
      }
      
    }
    
    return true
  }
}
Solution().isPalindrome(100)
Solution().isPalindrome(1010)
Solution().isPalindrome(10101)
