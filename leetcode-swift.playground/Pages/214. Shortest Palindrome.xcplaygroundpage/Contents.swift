class Solution {
//    func shortestPalindrome(_ s: String) -> String {
//        guard s.count > 1 else { return s }
//        let sArray = Array(s)
//        var allTheSame = true // 如果 s 每個 char 都一樣，就回傳 s
//        // 從 1~sArray.count/2 尋找每個 index 中，左右兩側最多相同的數量
//        var maxCount = 0 // 左右兩側最多相同的數量
//        var indexOfMaxCount = 0 // 左右兩側最多相同的數量的 index
//        for index in 0...sArray.count/2 {
//            var count = 0
//            var same = true
//            if index + 1 < sArray.count {
//                if sArray[index] != sArray[index + 1] {
//                    allTheSame = false
//                }
//            }
//            while (index - (count + 1) >= 0 &&
//                index + (count + 1) < sArray.count) && same {
//                    let left = sArray[index - (count + 1)]
//                    let right = sArray[index + (count + 1)]
//                    if left == right {
//                        count += 1
//                    } else {
//                        same = false
//                    }
//            }
//            if count > 0 {
//                // dict[index] = count
//                if count > maxCount {
//                    maxCount = count
//                    indexOfMaxCount = index
//                }
//            }
//        }
//        if allTheSame {
//            return s
//        }
//        print(indexOfMaxCount)
//        var temp = ""
//        for index in stride(from: sArray.count - 1, to: indexOfMaxCount*2, by: -1) {
//            temp.append(String(sArray[index]))
//        }
//        return temp + s
//    }
    
    // !!! KMP 演算法
    func shortestPalindrome(_ s: String) -> String {
        let sArray = Array(s)
        var end = sArray.count
        /*
         找出最長回文前綴，如 abbac 的最長回文前綴就是 abba
         方法是指針 i j 分別指向頭跟尾
         如果 s[i] == s[j] 則，i + 1, j - 1，否則只有 j - 1
         
         adcba
         */
        while true {
            var i = 0
            var j = end - 1
            while j >= 0 {
                if sArray[i] == sArray[j] {
                    i += 1
                }
                j -= 1
            }
            if i == end {
                break
            }
            end = i
        }
        return s.suffix(s.count - end).reversed() + s
    }
}

Solution().shortestPalindrome("abbacd") // dcabbacd
Solution().shortestPalindrome("aba") // aba
Solution().shortestPalindrome("ba") // aba
Solution().shortestPalindrome("")
Solution().shortestPalindrome("a") // a
Solution().shortestPalindrome("aa") // aa
Solution().shortestPalindrome("aaa") // aaa
Solution().shortestPalindrome("aaaa") // aaa
Solution().shortestPalindrome("aacecaaa") // aaacecaaa
Solution().shortestPalindrome("abcd") // dcbabcd
