/*
 
 In a deck of cards, every card has a unique integer.  You can order the deck in any order you want.
 
 Initially, all the cards start face down (unrevealed) in one deck.
 
 Now, you do the following steps repeatedly, until all cards are revealed:
 
 Take the top card of the deck, reveal it, and take it out of the deck.
 If there are still cards in the deck, put the next top card of the deck at the bottom of the deck.
 If there are still unrevealed cards, go back to step 1.  Otherwise, stop.
 Return an ordering of the deck that would reveal the cards in increasing order.
 
 The first entry in the answer is considered to be the top of the deck.
 
 # Example 1:
 Input: [17,13,11,2,3,5,7]
 Output: [2,13,3,11,5,17,7]
 Explanation:
 We get the deck in the order [17,13,11,2,3,5,7] (this order doesn't matter), and reorder it.
 After reordering, the deck starts as [2,13,3,11,5,17,7], where 2 is the top of the deck.
 We reveal 2, and move 13 to the bottom.  The deck is now [3,11,5,17,7,13].
 We reveal 3, and move 11 to the bottom.  The deck is now [5,17,7,13,11].
 We reveal 5, and move 17 to the bottom.  The deck is now [7,13,11,17].
 We reveal 7, and move 13 to the bottom.  The deck is now [11,17,13].
 We reveal 11, and move 17 to the bottom.  The deck is now [13,17].
 We reveal 13, and move 17 to the bottom.  The deck is now [17].
 We reveal 17.
 Since all the cards revealed are in increasing order, the answer is correct.
 
 Note:
    * 1 <= A.length <= 1000
    * 1 <= A[i] <= 10^6
    * A[i] != A[j] for all i != j
 
 */

class Solution {
    
    // *** 48 ms, faster than 55.56% ***
    // *** 21.2 MB, less than 100.00% ***
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        /*
            目的：讓 Output 可以在 Explanation 的動作後，成為排序好的樣子
            Output array 可以透過 reveal > append > reveal > append > ... 而排序完成
            因此利用排序好的 array，從最後面(最大值)做 unreveal > insert to 0 > unreveal > insert to 0 > ... 而逆向找回 Output
         */
 
        guard deck.count > 1 else { return deck }
        var nums = deck.sorted(by: { $0 < $1 })
        guard nums.count > 2 else { return nums }
        var result = [Int]()
        for index in stride(from: nums.count-1, through: 0, by: -1) {
            if result.count == 0 {
                result.append(nums[index])
            } else {
                result.insert(nums[index], at: 0)
                if index > 0 {
                    result.insert(result.removeLast(), at: 0)
                }
            }
        }
        return result
    }
}

Solution().deckRevealedIncreasing([17,13,11,2,3,5,7])
