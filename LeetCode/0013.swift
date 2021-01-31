// Roman to Integer
// https://leetcode.com/problems/roman-to-integer/

func romanToInt(_ s: String) -> Int {
    let strings = s.map{ String($0) }
    let romans = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    var sum = 0
    
    for i in 1..<strings.count {
        let prev = strings[i-1], curr = strings[i]
        sum += romans[prev]! >= romans[curr]! ? romans[prev]! : -romans[prev]!
    }
    return sum + romans[strings.last!]!
}
romanToInt("III") //3
romanToInt("IV") //4
romanToInt("IX") //9
romanToInt("LVIII") //58
romanToInt("MCMXCIV") //1994
