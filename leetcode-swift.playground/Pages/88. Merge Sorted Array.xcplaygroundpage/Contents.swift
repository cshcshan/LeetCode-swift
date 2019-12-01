/*
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:

 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 
 # Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
 
 */

class Solution {
    // 12 ms, faster than 84.54%
    // 20.8 MB, less than 33.33%
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//        var i = m - 1
//        var j = n - 1
//        var checkedCount = 0
//        while i >= 0 && j >= 0 {
//            let putIndex = (m + n - 1) - checkedCount
//            if nums1[i] > nums2[j] {
//                nums1[putIndex] = nums1[i]
//                i -= 1
//            } else {
//                nums1[putIndex] = nums2[j]
//                j -= 1
//            }
//            checkedCount += 1
//        }
//        while j >= 0 {
//            let putIndex = (m + n - 1) - checkedCount
//            nums1[putIndex] = nums2[j]
//            j -= 1
//            checkedCount += 1
//        }
//    }
    
    // 12 ms, faster than 84.54%
    // 20.8 MB, less than 33.33%
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m - 1
        var index2 = n - 1
        var last = (m + n - 1)
        while index1 >= 0 && index2 >= 0 {
            if nums1[index1] > nums2[index2] {
                nums1[last] = nums1[index1]
                index1 -= 1
            } else {
                nums1[last] = nums2[index2]
                index2 -= 1
            }
            last -= 1
        }
        while index2 >= 0 {
            nums1[last] = nums2[index2]
            index2 -= 1
            last -= 1
        }
    }
}

var nums1 = [1,2,3,0,0,0]
Solution().merge(&nums1, 3, [2,5,6], 3)
nums1 = [3,6,7,0,0,0]
Solution().merge(&nums1, 3, [2,5,6], 3)
