class Solution {
    // 12 ms, faster than 28.74%
    // 20.8 MB, less than 100.00%
//    var track: [Int] = []
//    func isHappy(_ n: Int) -> Bool {
//        guard n > 0 else { return false }
//        guard n != 1 else { return true }
//        var amount = 0
//        for c in String(n) {
//            guard let num = Int(String(c)) else { return false }
//            amount += num * num
//        }
//        guard amount != 1 else { return true }
//        if track.contains(amount) {
//            return false
//        } else {
//            track.append(amount)
//        }
//        return isHappy(amount)
//    }
    
    // !!!
    // 4 ms, faster than 97.98%
    // 20.6 MB, less than 100.00%
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        repeat {
            slow = calculate(slow)
            fast = calculate(fast)
            fast = calculate(fast)
        } while slow != fast
        return slow == 1
    }
    
    private func calculate(_ n: Int) -> Int {
        var n = n
        var sum = 0
        while n > 0 {
            let digit = n % 10
            sum += digit * digit
            n /= 10
        }
        return sum
    }
}

Solution().isHappy(0)
Solution().isHappy(1)
Solution().isHappy(2)
Solution().isHappy(4)
Solution().isHappy(19) // true
