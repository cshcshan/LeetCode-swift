/*
 
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
    "((()))",
    "(()())",
    "(())()",
    "()(())",
    "()()()"
 ]
 
 */

class Solution {
    // !!!
    // 16 ms, faster than 72.13%
    // 21.2 MB, less than 33.33%
    func generateParenthesis(_ n: Int) -> [String] {
        var array: [String] = []
        dfs(&array, "", leftCount: n, rightCount: 0)
        return array
    }
    
    private func dfs(_ array: inout [String], _ str: String, leftCount: Int, rightCount: Int) {
        if leftCount == 0 && rightCount == 0 {
            array.append(str)
            return
        }
        if rightCount > 0 {
            dfs(&array, str + ")", leftCount: leftCount, rightCount: rightCount - 1)
        }
        if leftCount > 0 {
            dfs(&array, str + "(", leftCount: leftCount - 1, rightCount: rightCount + 1)
        }
    }
}

Solution().generateParenthesis(3)
