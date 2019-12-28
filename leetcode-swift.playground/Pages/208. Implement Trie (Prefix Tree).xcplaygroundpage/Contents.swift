/*
 
 Implement a trie with insert, search, and startsWith methods.

 #  Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 
 */

// 1756 ms, faster than 6.40%
// 21.9 MB, less than 100.00%
//class Trie {
//    var dictionary: [String: Bool]
//
//    /** Initialize your data structure here. */
//    init() {
//        dictionary = [:]
//    }
//
//    /** Inserts a word into the trie. */
//    func insert(_ word: String) {
//        if dictionary[word] == nil {
//            dictionary[word] = true
//        }
//    }
//
//    /** Returns if the word is in the trie. */
//    func search(_ word: String) -> Bool {
//        return dictionary[word] != nil
//    }
//
//    /** Returns if there is any word in the trie that starts with the given prefix. */
//    func startsWith(_ prefix: String) -> Bool {
//        for (key, _) in dictionary {
//            if key.starts(with: prefix) {
//                return true
//            }
//        }
//        return false
//    }
//}

// !!!
// 304 ms, faster than 77.60%
// 28.8 MB, less than 100.00%
class Node {
    var wordEnd = false
    var next: [Character: Node] = [:]
}

/*
 
       root
      /    \
     a      b
    / \     |
   p  l     i
   |  |     |
   p  r     k
   |  |     |
   l  i     e
   |  |
   e  g
      |
      h
      |
      t
 
 
 */

class Trie {
    var root = Node()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var currentNode = root
        for c in word {
            print("insert >> \(c)")
            if let nextNode = currentNode.next[c] {
                currentNode = nextNode
            } else {
                let nextNode = Node()
                currentNode.next[c] = nextNode
                currentNode = nextNode
            }
        }
        currentNode.wordEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var currentNode = root
        for c in word {
            if let node = currentNode.next[c] {
                currentNode = node
            } else {
                return false
            }
        }
        return currentNode.wordEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        for c in prefix {
            if let node = currentNode.next[c] {
                currentNode = node
            } else {
                return false
            }
        }
        return true
    }
}

let word = "apple"
let obj = Trie()
obj.insert(word)
obj.search(word)
obj.startsWith("app")
obj.startsWith("aapp")
