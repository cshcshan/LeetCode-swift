class Solution {
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let num_Array = candidates.sorted { (int1, int2) -> Bool in
      return int1 < int2
    }
    
    var result = [[Int]]()
    recursive(0, num_Array: num_Array, target: target, subresult: [Int](), result: &result)
    
    return result
  }
  
  func recursive(_ index: Int, num_Array: [Int]!, target: Int, subresult: [Int], result: inout [[Int]]) {
    if target == 0 {
      result.append(subresult)
      return
    }
    for i in index..<num_Array.count {
      let complement = target - num_Array[i]
      if complement >= 0 {
        var _subresult = subresult
        _subresult.append(num_Array[i])
        recursive(i, num_Array: num_Array, target: complement, subresult: _subresult, result: &result)
      } else {
        break
      }
    }
  }
}
Solution().combinationSum([2, 3, 6, 7], 7)