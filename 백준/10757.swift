//✏️ 10757 큰 수 A+B
// https://www.acmicpc.net/problem/10757

let arr = readLine()!.split(separator: " ")
let a = splitNum(String(arr[0])), b = splitNum(String(arr[1]))
let l = isALonger(a,b) ? a : b
let s = isALonger(a,b) ? b : a
print(addNum(l,s))

func splitNum(_ str: String) -> [Int] {
    let intArr = str.map{ Int(String($0))! }
    return intArr
}

func isALonger(_ a: [Int],_ b: [Int]) -> Bool {
    return a.count >= b.count ? true : false
}

func addNum(_ l: [Int],_ s: [Int]) -> String {
    var long = l, short = s
    var carry = 0, sum = 0
    var result = ""
    
    func updateResult() {
        if sum > 9 {
            carry = 1
            sum = long.isEmpty ? sum : sum-10
        }
        result = String(sum) + result
    }
    
    while !short.isEmpty {
        sum = long.last! + short.last! + carry
        carry = 0
        long.removeLast()
        short.removeLast()
        updateResult()
    }
    
    while !long.isEmpty {
        sum = long.last! + carry
        carry = 0
        long.removeLast()
        updateResult()
    }
    return result
}
