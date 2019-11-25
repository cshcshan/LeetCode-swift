/*
 
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 # Example 1:
 
 Input: 2
 Output: 2
 
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 # Example 2:
 
 Input: 3
 Output: 3
 
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 
 */

class Solution {
//    func climbStairs(_ n: Int) -> Int {
//        var count = 0
//        recursively(n, &count)
//        return count
//    }
//
//    private func recursively(_ target: Int, _ count: inout Int) {
//        guard target > 0 else { return count += 1 }
//        if target > 1 {
//            recursively(target - 2, &count)
//        }
//        recursively(target - 1, &count)
//    }
    
    // 0 ms, faster than 100.00%
    // 20.8 MB, less than 20.00%
//    func climbStairs(_ n: Int) -> Int {
//        guard n > 2 else { return n }
//        var array: [Int] = [Int](repeating: 0, count: n)
//        array[0] = 1
//        array[1] = 2
//        for index in 2..<n {
//            array[index] = array[index-1] + array[index-2]
//        }
//        return array[n - 1]
//    }
    
    // 4 ms, faster than 86.95%
    // 20.9 MB, less than 20.00% 
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var array: [Int] = [1,2]
        for index in 2..<n {
            array.append(array[index-1] + array[index-2])
        }
        return array[n - 1]
    }
}

Solution().climbStairs(1) // 1 [1]
Solution().climbStairs(2) // 2 [1+1, 2]
Solution().climbStairs(3) // 3 [1+1+1, 1+2, 2+1]
Solution().climbStairs(4) // 5 [1+1+1+1, 1+1+2, 1+2+1, 2+1+1, 2+2]
Solution().climbStairs(5) // 8
Solution().climbStairs(6) // 13
Solution().climbStairs(7) // 21
Solution().climbStairs(44)
