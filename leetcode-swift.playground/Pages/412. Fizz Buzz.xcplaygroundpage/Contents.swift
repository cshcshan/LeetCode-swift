/*
 
 Write a program that outputs the string representation of numbers from 1 to n.
 
 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
 # Example:
 
 n = 15,
 
 Return:
 [
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
 ]
 
 */

class Solution {
    // 24 ms, faster than 86.87%
    // 21.1 MB, less than 50.00%
    func fizzBuzz(_ n: Int) -> [String] {
        var result: [String] = []
        for index in 0..<n {
            var str = ""
            if (index + 1) % 3 == 0 {
                str += "Fizz"
            }
            if (index + 1) % 5 == 0 {
                str += "Buzz"
            }
            if str == "" {
                str = String(index + 1)
            }
            result.append(str)
        }
        return result
    }
}

Solution().fizzBuzz(15)
