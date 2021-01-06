//✏️ 1009 분산 처리
//https://www.acmicpc.net/problem/1009

let tryCount = Int(readLine()!)!

for _ in 1...tryCount {
   let arr = readLine()!.split(separator: " ").map{ Int($0)! }
   print(lastComputer(a: arr[0], b: arr[1]))
}

func lastComputer(a: Int, b: Int) -> Int {
   var pattern = [a%10]
   var numNow = a

   for _ in 1...b {
       numNow *= a
       let remainder = numNow%10
       if remainder == pattern[0] {
           break
       } else {
           pattern.append(remainder)
       }
   }

   let count = pattern.count
   var i = b % count
   i += i == 0 ? count-1 : -1

   return pattern[i] == 0 ? 10 : pattern[i]
}
