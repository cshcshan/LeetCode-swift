public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode? // 雙向鏈結
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
//        var node: Node? = head
//        while node != nil && node!.next != nil {
//            node = node!.next
//        }
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        // 若再增減節點時立刻更新 count 數，可使速度從 O(n) 變成 O(1)
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func findNode(at index: Int) -> Node? {
        
        if index == 0 {
            return head
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node
        }
    }
    
    public subscript(index: Int) -> T? {
        let node = findNode(at: index)
        return node?.value
    }
    
    public func insert(_ node: Node, at index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            if let pre = self.findNode(at: index - 1), let next = pre.next {
                newNode.previous = pre
                newNode.next = pre.next
                pre.next = newNode
                next.previous = newNode
            }
        }
    }
    
    public func remove(node: Node) -> T? {
        let pre = node.previous
        let next = node.next
        
        if let pre = pre {
            pre.next = next
        } else {
            head = next
        }
        next?.previous = pre
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeLast() -> T? {
        guard let last = last else { return nil }
        return remove(node: last)
    }
    
    public func remove(at index: Int) -> T? {
        guard let node = findNode(at: index) else { return nil }
        return remove(node: node)
    }
    
    public func removeAll() {
        head = nil
    }
    
    public func reverse() {
        var node = head
//        tail = node // if you had a tail pointer
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
    
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(value: transform(node!.value))
            node = node?.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) -> LinkedList<T> {
        let result = LinkedList<T>()
        var node = head
        while node != nil {
            if predicate(node!.value) {
                result.append(value: node!.value)
            }
            node = node?.next
        }
        return result
    }
}

let list = LinkedList<String>()
list.isEmpty
list.first

list.append(value: "Hello")
list.isEmpty
list.first!.value
list.last!.value

list.append(value: "World")
list.isEmpty
list.first!.value
list.first!.previous
list.first!.next!.value
list.last!.value
list.last!.previous!.value
list.last!.next

list.findNode(at: 0)?.value
list.findNode(at: 1)?.value
list.findNode(at: 2)?.value

list[0]
list[1]
list[2]

list.insert(LinkedListNode(value: "Swift"), at: 1)
list[0]
list[1]
list[2]

list.remove(node: list.first!)
list.count
list[0]
list[1]

list.removeLast()
list.count
list[0]
list[1]

list.remove(at: 0)
list.count
list[0]
list[1]

list.removeAll()
list[0]

list.append(value: "Hello")
list.append(value: "Swifty")
list.append(value: "Universe")

let m = list.map { s in s.count }
//let m = list.map { (s) -> Int in
//    print(s)
//    return s.count
//}
m[0]
m[1]
m[2]

let f = list.filter { s in s.count > 5 }
f[0]
f[1]
f[2]
