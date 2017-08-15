//: Playground - noun: a place where people can play

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var dict = [Int: Int]() // [complement, index]
  for index in 0..<nums.count {
    let complement = target - nums[index]
    if let i = dict[nums[index]] {
      return [i, index]
    } else {
      dict[complement] = index
    }
  }
  return [0]
}
twoSum([2, 7, 11, 15], 9)
