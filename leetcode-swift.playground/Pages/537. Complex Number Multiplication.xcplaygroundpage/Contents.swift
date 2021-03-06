/*
 
 Given two strings representing two complex numbers.
 
 You need to return a string representing their multiplication. Note i2 = -1 according to the definition.
 
 # Example 1:
 
 Input: "1+1i", "1+1i"
 Output: "0+2i"
 Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.
 
 # Example 2:
 
 Input: "1+-1i", "1+-1i"
 Output: "0+-2i"
 Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert it to the form of 0+-2i.
 
 Note:
 
 The input strings will not have extra blank.
 The input strings will be given in the form of a+bi, where the integer a and b will both belong to the range of [-100, 100]. And the output should be also in this form.
 
 */

import Foundation

class Solution {
  func complexNumberMultiply(_ a: String, _ b: String) -> String {
    var result = ""
    
    let a_Array = a.components(separatedBy: "+")
    let b_Array = b.components(separatedBy: "+")
    let a1_String = a_Array[0].replacingOccurrences(of: "+", with: "")
    let a2_String = a_Array[1].replacingOccurrences(of: "+", with: "").replacingOccurrences(of: "i", with: "")
    let b1_String = b_Array[0].replacingOccurrences(of: "+", with: "")
    let b2_String = b_Array[1].replacingOccurrences(of: "+", with: "").replacingOccurrences(of: "i", with: "")
    
    if let a1_Int = Int(a1_String), let a2_Int = Int(a2_String), let b1_Int = Int(b1_String), let b2_Int = Int(b2_String) {
      let result_Int = a1_Int * b1_Int - a2_Int * b2_Int
      let result_i = a1_Int * b2_Int + a2_Int * b1_Int
      result = "\(String(describing: result_Int))+\(String(describing: result_i))i"
    }
    
    return result
  }
}

Solution().complexNumberMultiply("1+1i", "1+1i")
Solution().complexNumberMultiply("1+-1i", "1+-1i")
Solution().complexNumberMultiply("2+3i", "2+3i")
Solution().complexNumberMultiply("1+-1i", "0+0i")
