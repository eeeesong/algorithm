/*
 ✏️문제
 10진수, 2진수, 8진수 그 어느 것으로 표현하여도 대칭수가 되는 수 중,
 10진수의 10 이상에서의 최솟값을 구해보세요
 
 대칭수 예시: 787, 11011
 */

import Foundation

// 1️⃣ 몫, 나머지를 활용하여 2진수와 8진수 산출
func check(for number: Int) -> Bool {
    func checkDaeChing(for number: Int, _ jinsoo: Int) -> Bool {
        var N = number
        var newNArray: [Int] = []

        while N != 0 {
            newNArray.insert(N % jinsoo, at: 0)
            N = N / jinsoo
        }

        let reversed = [Int](newNArray.reversed())

        return newNArray == reversed ? true : false
    }

    if checkDaeChing(for: number, 10),
       checkDaeChing(for: number, 8),
       checkDaeChing(for: number, 2) {
        return true
    } else {
        return false
    }
}

var n = 9
var result = false

while result == false {
    n += 2 //홀수일 경우에만 2진수에서 대칭일 수 있으므로 홀수만 체크
    result = check(for: n)
}

print(n) //585


// 2️⃣ radix 활용하여 2진수와 8진수 산출

//func check(for number: Int) -> Bool {
//
//    func checkDaeChing(for number: Int, _ jinsoo: Int) -> Bool {
//        let newN = String(number, radix: jinsoo)
//        let reversed = String(newN.reversed())
//
//        return newN == reversed ? true : false
//    }
//
//    if checkDaeChing(for: number, 10),
//       checkDaeChing(for: number, 8),
//       checkDaeChing(for: number, 2) {
//        return true
//    } else { return false }
//}
//
//var n = 9
//var result = false
//
//while result == false {
//    n += 2 //홀수만 2진수에서 대칭일 수 있음
//    result = check(for: n)
//}
//
//print(n)
