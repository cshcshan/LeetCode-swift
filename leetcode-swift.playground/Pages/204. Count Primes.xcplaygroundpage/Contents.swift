/*
 
 Count the number of prime numbers less than a non-negative number, n.

 # Example:

 Input: 10
 Output: 4
 
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 
 */

import Foundation

class Solution {
    // 4680 ms, faster than 6.11%
    // 20.9 MB, less than 100.00%
//    func countPrimes(_ n: Int) -> Int {
//        guard n > 1 else { return 0 }
//        var primes: [Int] = []
//        for num in 2..<n {
//            var isPrime = true
//            for prime in primes {
//                if Double(prime) > sqrt(Double(num)) {
//                    break
//                }
//                if num % prime == 0 {
//                    isPrime = false
//                    break
//                }
//            }
//            if isPrime {
//                primes.append(num)
//            }
//        }
//        return primes.count
//    }
    
    // !!!
    // 96 ms, faster than 89.44%
    // 20.8 MB, less than 100.00%
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        guard n > 3 else { return 1 }
        var isPrime = [Bool](repeating: true, count: n + 1)
        var result = 0
        for num in 2...Int(sqrt(Double(n))) {
            if isPrime[num] {
                var powerNum = num * num
                while powerNum < n {
                    isPrime[powerNum] = false
                    powerNum += num
                }
            }
        }
        for num in 2..<n {
            if isPrime[num] {
                result += 1
            }
        }
        return result
    }
}

Solution().countPrimes(2) // 0
Solution().countPrimes(3) // 1
Solution().countPrimes(10) // 4 [2,3,5,7]
Solution().countPrimes(11) // 4 [2,3,5,7]
Solution().countPrimes(12) // 5 [2,3,5,7,11]
Solution().countPrimes(499979) // 41537
