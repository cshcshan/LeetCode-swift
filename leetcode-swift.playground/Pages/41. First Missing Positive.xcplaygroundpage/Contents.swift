/*
 
 Given an unsorted integer array, find the smallest missing positive integer.
 
 # Example 1:
 
 Input: [1,2,0]
 Output: 3
 
 # Example 2:
 
 Input: [3,4,-1,1]
 Output: 2
 
 # Example 3:
 
 Input: [7,8,9,11,12]
 Output: 1
 
 (448. Find All Numbers Disappeared in an Array)
 
 */

class Solution {
    // 8 ms, faster than 97.08%
    // 20.7 MB, less than 100.00%
    func firstMissingPositive(_ nums: [Int]) -> Int {
        // 1. 建立數量為 nums.count 的 array，並預設都放 0
        var array = [Int](repeating: 0, count: nums.count)
        // 2. 迴圈尋找 nums，並在 array 註記該數字已出現 (-1)
        for num in nums {
            if num > 0 && num <= array.count {
                array[num - 1] = -1
            }
        }
        // 3. 迴圈尋找 array 中第一個為 0 的數字
        for index in 0..<array.count {
            if array[index] == 0 {
                return index + 1
            }
        }
        // 4. 沒找到數字為 0 的數字表示該 nums 從 1 到 nums.count 都存在，所以回傳 array.count + 1
        return array.count + 1
    }
}

Solution().firstMissingPositive([-10,-1,-2]) // 1
Solution().firstMissingPositive([1,2,0]) // 3
Solution().firstMissingPositive([1,2,3]) // 4
Solution().firstMissingPositive([3,4,-1,1]) // 2
Solution().firstMissingPositive([7,8,9,11,12]) // 1
Solution().firstMissingPositive([5,6,7,8]) // 1
