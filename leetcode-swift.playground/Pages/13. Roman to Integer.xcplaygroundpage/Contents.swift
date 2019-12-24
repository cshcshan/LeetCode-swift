/*
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

 # Example 1:

 Input: "III"
 Output: 3
 
 # Example 2:

 Input: "IV"
 Output: 4
 
 # Example 3:

 Input: "IX"
 Output: 9
 
 # Example 4:

 Input: "LVIII"
 Output: 58
 
 Explanation: L = 50, V= 5, III = 3.
 
 # Example 5:

 Input: "MCMXCIV"
 Output: 1994
 
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 
 */

class Solution {
    
    func romanConvert(_ c: String) -> Int {
        switch c {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }
    
    func romanToInt(_ s: String) -> Int {
        var value = 0
        let char_Array = Array(s.uppercased())
        var isPlus = true
        for index in 0..<char_Array.count {
            isPlus = true
            let currentValue = romanConvert(String(char_Array[index]))
            if index < char_Array.count - 1 {
                let nextValue = romanConvert(String(char_Array[index + 1]))
                if nextValue != 0 {
                    if currentValue < nextValue {
                        isPlus = false
                    }
                }
            }
            if isPlus {
                value += currentValue
            } else {
                value -= currentValue
            }
        }
        
        return value
    }
}

Solution().romanToInt("1")
Solution().romanToInt("ZDA")
Solution().romanToInt("DCXXI")
Solution().romanToInt("DCXXIV")


/*
 I:    1
 V:    5
 X:   10
 L:   50
 C:  100
 D:  500
 M: 1000
 
 右加左減
 一個羅馬數字右邊放上一個較小的羅馬數字，表示大數字加小數字
 一個羅馬數字左邊放上一個較小的羅馬數字，表示大數字減小數字
 */


/*
 1:  I
 2:  II
 3:  III
 4:  IV
 5:  V
 6:  VI
 7:  VII
 8:  VIII
 9:  IX
 10: X
 */

/*
 11: XI
 12: XII
 13: XIII
 14: XIV
 15: XV
 16: XVI
 17: XVII
 18: XVIII
 19: XIX
 20: XX
 */

/*
 30:  XXX
 40:  XL
 50:  L
 60:  LX
 70:  LXX
 80:  LXXX
 90:  XC
 100: C
 101: CI
 150: CL
 200: CC
 300: CCC
 400: CD
 500: D
 600: DC
 700: DCC
 800: DCCC
 900: CM
 1000:M
 1600:MDC
 1700:MDCC
 1900:MCM
 */
