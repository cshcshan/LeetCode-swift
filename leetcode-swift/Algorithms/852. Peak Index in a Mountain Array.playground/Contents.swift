/*
 
 Let's call an array A a mountain if the following properties hold:
 
 A.length >= 3
 There exists some 0 < i < A.length - 1 such that A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
 Given an array that is definitely a mountain, return any i such that A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1].
 
 # Example 1:
 Input: [0,1,0]
 Output: 1
 
 # Example 2:
 Input: [0,2,1,0]
 Output: 1

 Note:
 
 3 <= A.length <= 10000
 0 <= A[i] <= 10^6
 A is a mountain, as defined above.
 
 */

class Solution {
    // 80 ms, faster than 97.04%
    // 21 MB, less than 100.00%
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        var index = A.count / 2
        while index >= 0 && index < A.count {
            let val = A[index]
            guard index - 1 >= 0 else { return index }
            guard index + 1 < A.count else { return index }
            
            let leftVal = A[index - 1]
            let rightVal = A[index + 1]
            if val > leftVal && val > rightVal {
                return index
            }
            if val < rightVal {
                index += 1
            }
            if leftVal > val {
                index -= 1
            }
        }
        return 0
    }
}

Solution().peakIndexInMountainArray([0,1,0]) // 1
Solution().peakIndexInMountainArray([0,2,1,0]) // 1
Solution().peakIndexInMountainArray([0,1,2,1,0]) // 2
Solution().peakIndexInMountainArray([0,10,5,2]) // 1
Solution().peakIndexInMountainArray([0,1,2,3,4,5,0]) // 5
