/*

 Given an array A, we can perform a pancake flip: We choose some positive integer k <= A.length, then reverse the order of the first k elements of A.  We want to perform zero or more pancake flips (doing them one after another in succession) to sort the array A.
 
 Return the k-values corresponding to a sequence of pancake flips that sort A.  Any valid answer that sorts the array within 10 * A.length flips will be judged as correct.
 
 # Example 1:
 Input: [3,2,4,1]
 Output: [4,2,4,3]
 Explanation:
 We perform 4 pancake flips, with k values 4, 2, 4, and 3.
 Starting state: A = [3, 2, 4, 1]
 After 1st flip (k=4): A = [1, 4, 2, 3]
 After 2nd flip (k=2): A = [4, 1, 2, 3]
 After 3rd flip (k=4): A = [3, 2, 1, 4]
 After 4th flip (k=3): A = [1, 2, 3, 4], which is sorted.
 
 # Example 2:
 Input: [1,2,3]
 Output: []
 Explanation: The input is already sorted, so there is no need to flip anything.
 Note that other answers, such as [3, 3], would also be accepted.
 
 Note:
 1 <= A.length <= 100
 A[i] is a permutation of [1, 2, ..., A.length]
 
 */

class Solution {
    
    // *** 96 ms, faster than 14.29% ***
    // *** 21.3 MB, less than 100.00% ***
//    func pancakeSort(_ A: [Int]) -> [Int] {
//        var target = A.count
//        var nums = A
//        var result: [Int] = []
//        while target > 0 {
//            findSwapPosition(&nums, target: target, position: &result)
//            target -= 1
//        }
//        return result
//    }
//
//    private func findSwapPosition(_ nums: inout [Int], target: Int, position: inout [Int]) {
//        for index in 0..<target {
//            if nums[index] == target {
//                if index + 1 == target {
//                    return
//                } else if index == 0 {
//                    var subnums = Array(nums[0..<target])
//                    swap(&subnums)
//                    nums = subnums + Array(nums[target..<nums.count])
//                    position.append(target)
//                    break
//                } else {
//                    var subnums = Array(nums[0...index])
//                    swap(&subnums)
//                    nums = subnums + Array(nums[index+1..<nums.count])
//                    position.append(index + 1)
//                    findSwapPosition(&nums, target: target, position: &position)
//                    break
//                }
//            }
//        }
//    }
//
//    private func swap(_ nums: inout [Int]) {
//        for index in 0..<nums.count/2 {
//            let temp = nums[index]
//            nums[index] = nums[(nums.count - 1) - index]
//            nums[(nums.count - 1) - index] = temp
//        }
//    }
    
    // *** 104 ms, faster than 7.14% ***
    // *** 21.3 MB, less than 100.00% ***
    func pancakeSort(_ A: [Int]) -> [Int] {
        var target = A.count
        var nums = A
        var positions: [Int] = []
        while target > 0 {
            findSwapPosition(&nums, positions: &positions, target: target)
            target -= 1
        }
        return positions
    }
    
    private func findSwapPosition(_ nums: inout [Int], positions: inout [Int], target: Int) {
        for index in 0..<target {
            guard nums[index] == target else { continue }
            
            if index + 1 == target {
                return
            }
            
            if index != 0 {
                let subnums = Array(nums[0...index]).reversed()
                nums = subnums + Array(nums[index+1..<nums.count])
                positions.append(index + 1)
            }
            
            if index == 0 || nums[0] == target {
                let subnums = Array(nums[0..<target]).reversed()
                nums = subnums + Array(nums[target..<nums.count])
                positions.append(target)
            }
            
            break
        }
    }
}

Solution().pancakeSort([3,2,4,1]) // [4,2,4,3], [3, 4, 2, 3, 2]
