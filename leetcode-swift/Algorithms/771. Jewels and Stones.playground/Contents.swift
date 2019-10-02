/*
 
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
 Each character in S is a type of stone you have.
 You want to know how many of the stones you have are also jewels.
 
 The letters in J are guaranteed distinct, and all characters in J and S are letters.
 Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 # Example 1:
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 
 # Example 2:
 
 Input: J = "z", S = "ZZ"
 Output: 0
 
 Note:
 
 S and J will consist of letters and have length at most 50.
 The characters in J are distinct.
 
 */

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var amount = 0
        let jArray = Array(J)
        var sArray = Array(S)
        for j in jArray {
            for sIndex in stride(from: sArray.count - 1, to: -1, by: -1) {
                if j == sArray[sIndex] {
                    amount += 1
                    sArray.remove(at: sIndex)
                }
            }
        }
        return amount
    }
}

Solution().numJewelsInStones("aA", "aAAbbbb")
Solution().numJewelsInStones("z", "ZZ")
