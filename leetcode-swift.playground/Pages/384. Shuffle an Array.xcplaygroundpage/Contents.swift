/*
 
 Shuffle a set of numbers without duplicates.
 
 # Example:
 
 // Init an array with set 1, 2, and 3.
 int[] nums = {1,2,3};
 Solution solution = new Solution(nums);
 
 // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
 solution.shuffle();
 
 // Resets the array back to its original configuration [1,2,3].
 solution.reset();
 
 // Returns the random shuffling of array [1,2,3].
 solution.shuffle();
 
 */

// 452 ms, faster than 83.33%
// 23 MB, less than 25.00%
class Solution {
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }

    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }

    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var result: [Int] = []
        var tempNums = nums
        for _ in 0..<nums.count {
            let randomIndex = Int.random(in: 0..<tempNums.count)
            result.append(tempNums.remove(at: randomIndex))
        }
        return result
    }
}

let nums = [1,2,3]
let obj = Solution(nums)
let ret_1 = obj.reset()
let ret_2 = obj.shuffle()
