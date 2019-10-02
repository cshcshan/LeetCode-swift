/*
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
 
 The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49 which is from (1, 8) to (8, 7).
 
 # Example:
 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49
 
 */

class Solution {
    
    // *** 120 ms, faster than 25.23% ***
    // *** 21.1 MB, less than 20.00% ***
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            let area = (right - left) * min(height[right], height[left])
            result = max(result, area)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
}

Solution().maxArea([1,8,6,2,5,4,8,3,7]) // 49
Solution().maxArea([1,1]) // 1
Solution().maxArea([2,3,4,5,18,17,6]) // 17
Solution().maxArea([1,2,1]) // 2
