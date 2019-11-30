/*
 
 Given an array of strings, group anagrams together.
 
 # Example:
 
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
    ["ate","eat","tea"],
    ["nat","tan"],
    ["bat"]
 ]
 
 Note:
 
 All inputs will be in lowercase.
 The order of your output does not matter.
 
 */

class Solution {
    // !!!
    // 196 ms, faster than 80.11%
    // 23.6 MB, less than 33.33%
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let sortedStr = String(str.sorted())
            var array = dict[sortedStr]
            if array == nil {
                array = [str]
            } else {
                array!.append(str)
            }
            dict[sortedStr] = array!
        }
        return Array(dict.values)
    }
}

Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
/*
 [
    ["ate","eat","tea"],
    ["nat","tan"],
    ["bat"]
 ]
 */
