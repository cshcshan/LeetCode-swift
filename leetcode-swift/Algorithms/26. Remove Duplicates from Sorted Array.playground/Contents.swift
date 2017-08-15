class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    for index in stride(from: nums.count-1, to: -1, by: -1) {
      if index > 0 {
        if nums[index - 1] == nums[index] {
          nums.remove(at: index)
        }
      }
    }
    
    return nums.count
  }
}
var int_Array = [1,1,2]
Solution().removeDuplicates(&int_Array)