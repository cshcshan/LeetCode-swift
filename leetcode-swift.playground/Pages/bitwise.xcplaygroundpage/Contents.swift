// https://github.com/yllan/AQWQ/blob/master/bitwise/README.md

// Q: 要如何產生只有在第 x 個位置為 1 的數字呢？
func one_at(_ position: Int) -> String {
    let val: UInt8 = 1 << position
    return String(val, radix: 2)
}

one_at(0) // 00000001
one_at(1) // 00000010
one_at(5) // 00100000

// Q: 如何產生只有在第 x 個位置為 0 的數字呢？
func zero_at(_ position: Int) -> String {
    let val: UInt8 = ~(1 << position)
    return String(val, radix: 2)
}

zero_at(0) // 11111110
zero_at(2) // 11111011
zero_at(5) // 11011111

// Q: 要如何把一個數 x 的第 n 個位置設成 1 呢？
func set_one_at(_ val: UInt8, _ position: Int) -> String {
    let newVal: UInt8 = val | (1 << position)
    return String(newVal, radix: 2)
}

set_one_at(0b10101010, 0) // 10101011
set_one_at(0b10101010, 2) // 10101110
set_one_at(0b10101010, 5) // 10101010

// Q: 要如何把一個數 x 的第 n 個位置設成 0 呢？
func set_zero_at(_ val: UInt8, _ position: Int) -> String {
    let newVal: UInt8 = val & ~(1 << position)
    return String(newVal, radix: 2)
}

set_zero_at(0b10101010, 0) // 10101010
set_zero_at(0b10101010, 2) // 10101010
set_zero_at(0b10101010, 5) // 10001010

// Q: 要如何把一個數 x 的第 n 個位置 flip 呢？
func flip_at(_ val: UInt8, _ position: Int) -> String {
    let newVal: UInt8 = val ^ (1 << position)
    return String(newVal, radix: 2)
}

flip_at(0b10101010, 0) // 10101011
flip_at(0b10101010, 2) // 10101110
flip_at(0b10101010, 5) // 10001010

// Q: 要如何判斷一個數 x 的第 n 個位置是不是 1 呢？
func is_on(_ val: UInt8, _ position: Int) -> Bool {
    let newVal: UInt8 = val & (1 << position)
    return newVal == (1 << position)
}

is_on(0b10101010, 0) // false
is_on(0b10101010, 2) // false
is_on(0b10101010, 5) // true

