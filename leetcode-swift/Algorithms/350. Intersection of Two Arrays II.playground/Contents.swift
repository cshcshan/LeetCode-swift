/*
 
 Given two arrays, write a function to compute their intersection.
 
 # Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 # Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 
 Note:
 
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 
 Follow up:
 
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

 */

class Solution {
    // 44 ms, faster than 33.54%
    // 21 MB, less than 20.00%
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        guard nums1.count > 0 && nums2.count > 0 else { return [] }
//        var result: [Int] = []
//        let sorted1 = nums1.sorted(by: <)
//        var sorted2 = nums2.sorted(by: <)
//        for i in stride(from: sorted1.count - 1, through: 0, by: -1) {
//            let num1 = sorted1[i]
//            guard sorted2.count > 0 else { break }
//            while sorted2.count > 0 && num1 < sorted2.last! {
//                sorted2.removeLast()
//            }
//            guard sorted2.count > 0 else { break }
//            if num1 == sorted2.last! {
//                result.append(num1)
//                sorted2.removeLast()
//            }
//        }
//        return result
//    }
    
    // 24 ms, faster than 96.07%
    // 20.9 MB, less than 20.00%
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        guard nums1.count > 0 && nums2.count > 0 else { return [] }
//        var dictionary: [Int:Int] = [:]
//        var result: [Int] = []
//        for num in nums1 {
//            if let count = dictionary[num] {
//                dictionary[num] = count + 1
//            } else {
//                dictionary[num] = 1
//            }
//        }
//        for num in nums2 {
//            if let count = dictionary[num], count > 0 {
//                dictionary[num] = count - 1
//                result.append(num)
//            }
//        }
//        return result
//    }
    
    // 40 ms, faster than 42.60%
    // 21 MB, less than 20.00%
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0 && nums2.count > 0 else { return [] }
        var result: [Int] = []
        let sorted1 = nums1.sorted(by: <)
        var sorted2 = nums2.sorted(by: <)
        var i = 0, j = 0
        while i < sorted1.count && j < sorted2.count {
            let num1 = sorted1[i]
            let num2 = sorted2[j]
            if num1 == num2 {
                result.append(num1)
                i += 1
                j += 1
            } else if num1 < num2 {
                i += 1
            } else {
                j += 1
            }
        }
        return result
    }
}

Solution().intersect([], []) // []
Solution().intersect([2,2], [1,1,3,3]) // []
Solution().intersect([2,2], [3,3]) // []
Solution().intersect([1,2,3], [2,3,4]) // [2,3]
Solution().intersect([1,2,3], [4]) // []
Solution().intersect([2,2], [1,1]) // []
Solution().intersect([1,2,2,1], [2,2]) // [2,2]
Solution().intersect([4,9,5], [9,4,9,8,4,10]) // [4,9]
