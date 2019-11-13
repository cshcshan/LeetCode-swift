/*
 
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.
 
 You may return any answer array that satisfies this condition.
 
 # Example 1:
 
 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 
 Note:
    * 1 <= A.length <= 5000
    * 0 <= A[i] <= 5000
 
 */

class Solution {
    
    // *** 72 ms, faster than 82.83% ***
    // *** 21.4 MB, less than 25.00% ***
//    func sortArrayByParity(_ A: [Int]) -> [Int] {
//        var resultEven = [Int]()
//        var resultOdd = [Int]()
//        for num in A {
//            if num % 2 == 0 {
//                resultEven.append(num)
//            } else {
//                resultOdd.append(num)
//            }
//        }
//        resultEven.append(contentsOf: resultOdd)
//        return resultEven
//    }
    
    // *** 80 ms, faster than 41.00% ***
    // *** 21.4 MB, less than 25.00% ***
//    func sortArrayByParity(_ A: [Int]) -> [Int] {
//        var result = [Int]()
//        for num in A {
//            if num % 2 == 0 {
//                result.insert(num, at: 0)
//            } else {
//                result.append(num)
//            }
//        }
//        return result
//    }
    
    // *** 64 ms, faster than 100.00% ***
    // 21.5 MB, less than 25.00%
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var resultEven = [Int]()
        var resultOdd = [Int]()
        A.forEach { (num) in
            if num % 2 == 0 {
                resultEven.append(num)
            } else {
                resultOdd.append(num)
            }
        }
        resultEven.append(contentsOf: resultOdd)
        return resultEven
    }
}

Solution().sortArrayByParity([3])
Solution().sortArrayByParity([3,1,2,4])
