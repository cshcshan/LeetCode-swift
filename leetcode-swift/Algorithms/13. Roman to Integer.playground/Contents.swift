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
