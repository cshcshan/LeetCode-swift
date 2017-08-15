class Solution {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    for index in stride(from: nums.count - 1, to: -1, by: -1) {
      if nums[index] == val {
        nums.remove(at: index)
      }
    }
    
    return nums.count
  }
}
var int_Array = [3,3,2,2,3]
Solution().removeElement(&int_Array, 3)
var int_Array2 = [1]
Solution().removeElement(&int_Array2, 1)
