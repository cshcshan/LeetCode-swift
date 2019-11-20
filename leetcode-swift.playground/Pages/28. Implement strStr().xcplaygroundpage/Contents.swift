/*
 
 Implement strStr().
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 # Example 1:
 
 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 # Example 2:
 
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 
 Clarification:
 
 What should we return when needle is an empty string? This is a great question to ask during an interview.
 
 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 
 */

class Solution {
    // 8 ms, faster than 93.98%
    // 20.9 MB, less than 100.00%
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        guard haystack != needle else { return 0 }
//        guard needle.count > 0 else { return 0 }
//        guard haystack.count > needle.count else { return -1 }
//        let result = -1
//        let strArray = Array(haystack)
//        let needleArray = Array(needle)
//        for i in 0...strArray.count-needleArray.count {
//            if strArray[i] == needleArray[0] {
//                var match = true
//                for j in 1..<needleArray.count {
//                    if strArray[i+j] != needleArray[j] {
//                        match = false
//                        break
//                    }
//                }
//                if match {
//                    return i
//                }
//            }
//        }
//        return result
//    }
    
    /*
     !!! KMP
     
     i 是 haystack 的位置、j 是 needle 的位置
     如果 haystack[i] == needle[j] => i += 1 and j += 1，繼續檢查下一個位置是否相同
     如果 j != -1 && haystack[i] != needle[j] => i 不變，j = next[j]
        意即，needle 相對於 haystack 向右移動了 j - next[j]
        也就是說，needle 向右移動的距離 = 已經符合的字元數量 - 不符合的字元的上一個字元所對應的最大長度
     !!!    或是 needle 向右移動的距離 = 不符合的字元的位置 - 不符合的字元對應的 next 值
     如果 j == -1
     
     # 例如：haystack = "BBC ABCDAB ABCDABCDABDE", needle = "ABCDABD"
     
     1. i = 4, j = 0 時都是 A
     
     2. i = 10, j = 6 時，一個是空格，一個是 D => i 不變，j = next[j]
     
        BBC ABCDAB ABCDABCDABDE
            ABCDABD
     
        分析一下 needle:
                          A B C D A B D
        每個前綴後綴長度 =>  0 0 0 0 1 2 0
     
        向右移動的距離 = 已經符合的字元(D)數量(6 = ABCDAB) - 不符合的字元(D)的上一個字元(B)所對應的最大長度(2)
                    = 6 - 2 = 4
        向右移動的距離 = 不符合的字元(D)的位置(6) - 不符合的字元(6)對應的 next 值(2)
                    = 6 - 2 = 4
        j = j - 向右移動的距離 = 6 - 4 = 2
     
     3. i = 10, j = 2 時，一個是空格，一個是 C => i 不變，j = next[j]
     
        BBC ABCDAB ABCDABCDABDE
                ABCDABD
     
        向右移動的距離 = 2 - 0 = 2
        j = j - 向右移動的距離 = 2 - 2 = 0
     
     4. i = 10, j = 0 時，一個是空格，一個是 A => i 不變，j = next[j]
     
        BBC ABCDAB ABCDABCDABDE
                  ABCDABD
     
        !!!
        分析一下 needle:
                          A B C D A B D
        每個前綴後綴長度 =>  0 0 0 0 1 2 0
                 next => -1 0 0 0 0 1 2
     
        可以發現 next = 每個前綴後綴長度整格往右移一格，然後第一格固定給 -1
     
        i = 10, j = -1 => 因為 j = -1 => i = 11, j = 0
     
     */
    // 8 ms, faster than 93.98%
    // 20.7 MB, less than 100.00%
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack != needle else { return 0 }
        guard needle.count > 0 else { return 0 }
        guard haystack.count > needle.count else { return -1 }
        var i = 0
        var j = 0
        let hArray = Array(haystack)
        let nArray = Array(needle)
        let nextArray = getNextArray(nArray)
        while i < hArray.count && j < nArray.count {
            if j == -1 || hArray[i] == nArray[j] {
                i += 1
                j += 1
            } else {
                j = nextArray[j]
            }
        }
        return (j == nArray.count) ? i - j : -1
    }
    
    private func getNextArray(_ nArray: [String.Element]) -> [Int] {
        var k = -1
        var j = 0
        var next = [Int](repeating: -1, count: nArray.count)
        /*
         index = 0 的 next 值固定是 -1
         
         # 如果 nArray[j] == nArray[k]
         
                A B C D A B C E
         next   0 0 0 0 1 2 3 ?
                    k       j
         
         求 next[7](E)
         因為 nArray[j] == nArray[k]
         => next[j+1] = next[j] + 1 = k + 1 = 3
         
         # 如果 nArray[j] != nArray[k]
         
                A B C D A B D E
         next   0 0 0 0 1 2 3 ?
                    k       j
         
         求 next[7](E)
         因為 nArray[j] != nArray[k]
         => 在 k 前面找出 k1，使 nArray[k1] 為 D
         => nArray[k1] = nArray[j]
         => next[j+1] = k1 + 1
         但這個例子因為找不到 k1，所以 next[j+1] = 0
         
                D A B C D A B D E
         next  -1 0 0 0 0 1 2 3
                      k       j
         
         求 next[8](E)
         因為 nArray[j] != nArray[k]
         => 讓 k = next[k] = 0
         => nArray[0] = D
         => next[j+1] = k + 1 = 1
         
         */
        while j < nArray.count - 1 {
            if k == -1 || nArray[k] == nArray[j] {
                k += 1
                j += 1
                next[j] = (nArray[j] != nArray[k]) ? k : next[k]
            } else {
                k = next[k]
            }
        }
        return next
    }
}

Solution().strStr("","") // 0
Solution().strStr("a","") // 0
Solution().strStr("","a") // -1
Solution().strStr("aa","aaa") // -1
Solution().strStr("hello","ll") // 2
Solution().strStr("aaaaa","bba") // -1
Solution().strStr("mississippi","ssipi") // -1
Solution().strStr("mississippi","pi") // 9
