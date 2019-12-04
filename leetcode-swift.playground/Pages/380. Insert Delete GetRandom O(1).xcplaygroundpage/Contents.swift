/*
 
 Design a data structure that supports all following operations in average O(1) time.

 insert(val): Inserts an item val to the set if not already present.
 remove(val): Removes an item val from the set if present.
 getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
 
 # Example:

 // Init an empty set.
 RandomizedSet randomSet = new RandomizedSet();

 // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomSet.insert(1);

 // Returns false as 2 does not exist in the set.
 randomSet.remove(2);

 // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomSet.insert(2);

 // getRandom should return either 1 or 2 randomly.
 randomSet.getRandom();

 // Removes 1 from the set, returns true. Set now contains [2].
 randomSet.remove(1);

 // 2 was already in the set, so return false.
 randomSet.insert(2);

 // Since 2 is the only number in the set, getRandom always return 2.
 randomSet.getRandom();
 
 */

// 3220 ms, faster than 5.45%
// 21.4 MB, less than 100.00%
//class RandomizedSet {
//
//    var array: [Int]
//
//    /** Initialize your data structure here. */
//    init() {
//        array = []
//    }
//
//    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
//    func insert(_ val: Int) -> Bool {
//        guard !array.contains(val) else { return false }
//        array.append(val)
//        return true
//    }
//
//    /** Removes a value from the set. Returns true if the set contained the specified element. */
//    func remove(_ val: Int) -> Bool {
//        guard let index = array.firstIndex(of: val) else { return false }
//        array.remove(at: index)
//        return true
//    }
//
//    /** Get a random element from the set. */
//    func getRandom() -> Int {
//        guard !array.isEmpty else { return 0 }
//        return array[Int.random(in:0..<array.count)]
//    }
//}

// 1660 ms, faster than 5.45%
// 22.2 MB, less than 100.00%
//class RandomizedSet {
//
//    var array: [Int]
//    var dict: [Int: Int] // 紀錄數值在什麼位置 [value: index]
//
//    /** Initialize your data structure here. */
//    init() {
//        array = []
//        dict = [:]
//    }
//
//    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
//    func insert(_ val: Int) -> Bool {
//        guard dict[val] == nil else { return false }
//        array.append(val)
//        dict[val] = array.count - 1
//        return true
//    }
//
//    /** Removes a value from the set. Returns true if the set contained the specified element. */
//    func remove(_ val: Int) -> Bool {
//        guard let index = dict[val] else { return false }
//        for i in (index+1)..<array.count {
//            let val = array[i]
//            dict[val] = (dict[val] ?? 1) - 1
//        }
//        array.remove(at: index)
//        dict.removeValue(forKey: val)
//        return true
//    }
//
//    /** Get a random element from the set. */
//    func getRandom() -> Int {
//        guard !array.isEmpty else { return 0 }
//        return array[Int.random(in:0..<array.count)]
//    }
//}

// 200 ms, faster than 46.36%
// 23.5 MB, less than 100.00%
class RandomizedSet {
    
    var set: Set<Int>

    /** Initialize your data structure here. */
    init() {
        set = Set<Int>()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        guard !set.contains(val) else { return false }
        set.insert(val)
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        guard set.contains(val) else { return false }
        set.remove(val)
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return set.randomElement() ?? 0
    }
}

var obj = RandomizedSet()
obj.insert(1) // true
obj.remove(2) // false
obj.insert(2) // true
obj.getRandom() // 1 or 2
obj.remove(1) // true
obj.insert(2) // false
obj.getRandom() // 2

obj = RandomizedSet()
obj.remove(0) // false
obj.remove(0) // false
obj.insert(0) // true
obj.getRandom() // 0
obj.remove(0) // true
obj.insert(0) // true

obj = RandomizedSet()
obj.insert(0) // true
obj.insert(1) // true
obj.remove(0) // true
obj.insert(2) // true
obj.remove(1) // true
obj.getRandom() // 2
