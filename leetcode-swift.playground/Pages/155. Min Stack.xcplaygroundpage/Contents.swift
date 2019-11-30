/*
 
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 
 # Example:
 
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 
 */

// 1564 ms, faster than 5.56%
// 21.8 MB, less than 25.00%
//class MinStack {
//    var nums: [Int]
//
//    /** initialize your data structure here. */
//    init() {
//        nums = []
//    }
//
//    func push(_ x: Int) {
//        nums.append(x)
//    }
//
//    func pop() {
//        nums.removeLast()
//    }
//
//    func top() -> Int {
//        guard nums.count > 0 else { return 0 }
//        return nums[nums.count - 1]
//    }
//
//    func getMin() -> Int {
//        guard nums.count > 0 else { return Int.min }
//        var min: Int = nums[0]
//        for index in 1..<nums.count {
//            let num = nums[index]
//            if num < min {
//                min = num
//            }
//        }
//        return min
//    }
//}

// !!! how to access minStack inside push() and pop()
// 100 ms, faster than 75.16%
// 22 MB, less than 25.00%
class MinStack {
    var stack: [Int]
    var minStack: [Int]
    
    /** initialize your data structure here. */
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
    }
    
    func pop() {
        guard !stack.isEmpty else { return }
        let removedVal = stack.removeLast()
        if let last = minStack.last, last == removedVal {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.isEmpty ? 0 : stack.last!
    }
    
    func getMin() -> Int {
        return minStack.isEmpty ? 0 : minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let obj = MinStack()
obj.push(20)
obj.getMin()
obj.push(40)
obj.getMin()
obj.push(10)
obj.getMin()
obj.push(15)
obj.getMin()
obj.pop()
obj.getMin()
