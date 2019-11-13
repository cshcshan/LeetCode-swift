/*
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 
 # Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 5
 
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Not 7-1 = 6, as selling price needs to be larger than buying price.
 
 # Example 2:
 
 Input: [7,6,4,3,1]
 Output: 0
 
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 */

class Solution {
    // 40 ms, faster than 54.66%
    // 21.1 MB, less than 16.67%
//    func maxProfit(_ prices: [Int]) -> Int {
//        guard prices.count > 1 else { return 0 }
//        var result = 0
//        var buy = -1, sell = -1
//        for index in 0..<prices.count {
//            let price = prices[index]
//            if buy == -1 || price < buy {
//                if sell > -1 {
//                    let profit = (sell - buy)
//                    if profit > result {
//                        result = profit
//                    }
//                }
//                buy = price
//                sell = -1
//            } else {
//                if price > sell {
//                    sell = price
//                }
//            }
//        }
//        if buy > -1 && sell > -1 {
//            let profit = (sell - buy)
//            if profit > result {
//                result = profit
//            }
//        }
//        return result
//    }
    
    // 40 ms, faster than 54.66%
    // 21.2 MB, less than 16.67%
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var result = 0
        var minPrice = prices[0]
        for index in 1..<prices.count {
            let price = prices[index]
            let difference = price - minPrice
            if difference > result {
                result = difference
            }
            if price < minPrice {
                minPrice = price
            }
        }
        return result
    }
}

Solution().maxProfit([2,1,2,0,1]) // 1
Solution().maxProfit([3,1]) // 0
Solution().maxProfit([7,1,5,3,6,4]) // 5
Solution().maxProfit([7,6,4,3,1]) // 0
Solution().maxProfit([7,6,4,1,3]) // 2
Solution().maxProfit([7,6,3,4,1]) // 1
Solution().maxProfit([7,6,3,4,1,2]) // 1
Solution().maxProfit([7,6,3,4,5,1,2]) // 2
