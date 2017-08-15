class Solution {
  func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    for index in 0..<nums.count {
      if target <= nums[index] {
        return index
      }
    }
    
    return nums.count
  }
}
Solution().searchInsert([1,3,5,6], 5)
Solution().searchInsert([1,3,5,6], 2)
Solution().searchInsert([1,3,5,6], 7)
Solution().searchInsert([1,3,5,6], 0)

/*
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */