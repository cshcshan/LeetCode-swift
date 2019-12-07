/*
 
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

 Note: You are not suppose to use the library's sort function for this problem.

 # Example:

 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 
 Follow up:

 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
 
 */

class Solution {
    // !!!
    // 8 ms, faster than 85.64%
    // 20.9 MB, less than 100.00%
//    func sortColors(_ nums: inout [Int]) {
//        var red = 0
//        var white = 0
//        var blue = 0
//        for num in nums {
//            switch num {
//            case 0: red += 1
//            case 1: white += 1
//            case 2: blue += 1
//            default: break
//            }
//        }
////        for index in 0..<red {
////            nums[index] = 0
////        }
////        for index in red..<red+white {
////            nums[index] = 1
////        }
////        for index in red+white..<nums.count {
////            nums[index] = 2
////        }
//        for index in 0..<nums.count {
//            if index < red {
//                nums[index] = 0
//            } else if index < red + white {
//                nums[index] = 1
//            } else {
//                nums[index] = 2
//            }
//        }
//    }
    
    // 16 ms, faster than 7.98%
    // 20.9 MB, less than 100.00%
//    func sortColors(_ nums: inout [Int]) {
//        var red = 0
//        var blue = nums.count - 1
//        var index = 0
//        while index <= blue {
//            switch nums[index] {
//            case 0:
//                nums.swapAt(index, red)
//                red += 1
//            case 2:
//                if index != blue {
//                    nums.swapAt(index, blue)
//                    blue -= 1
//                    index -= 1 // 因為交換後要重新確認 index 位置的值，但 while loop 最後又會讓 index + 1，所以在這裡先 index -= 1 處理
//                }
//            default: break
//            }
//            index += 1
//        }
//    }

    // !!! 少了 case 2 的 if index != blue {} 快了一倍
    // 8 ms, faster than 85.64%
    // 20.7 MB, less than 100.00%
    func sortColors(_ nums: inout [Int]) {
        var red = 0
        var blue = nums.count - 1
        var index = 0
        while index <= blue {
            switch nums[index] {
            case 0:
                nums.swapAt(index, red)
                red += 1
            case 2:
                nums.swapAt(index, blue)
                blue -= 1
                index -= 1 // 因為交換後要重新確認 index 位置的值，但 while loop 最後又會讓 index + 1，所以在這裡先 index -= 1 處理
            default: break
            }
            index += 1
        }
    }
}

var nums = [0,1,2]
Solution().sortColors(&nums)
nums = [2,0,1]
Solution().sortColors(&nums) // [0,1,2]
nums = [1,2]
Solution().sortColors(&nums)
nums = [0,2]
Solution().sortColors(&nums)
nums = [0,1]
Solution().sortColors(&nums)
nums = [0]
Solution().sortColors(&nums)
nums = [1]
Solution().sortColors(&nums)
nums = [2]
Solution().sortColors(&nums)
nums = []
Solution().sortColors(&nums)
nums = [2,0,2,1,1,0]
Solution().sortColors(&nums) // [0,0,1,1,2,2]
nums = [2,0,2,1,1,1]
Solution().sortColors(&nums) // [0,0,1,1,2,2]
nums = [2,0,2,1,0,1]
Solution().sortColors(&nums) // [0,0,1,1,2,2]
