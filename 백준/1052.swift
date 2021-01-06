//✏️ 1052 물병
// https://www.acmicpc.net/problem/1052

import Foundation

var t: Int32 = 1
var count: Float = 0
var twoPowArr = [Int32]()
let max: Float = pow(10, 7)

while t <= Int32(max) {
    t = Int32(pow(2.0, count))
    twoPowArr.append(t)
    count += 1
}
twoPowArr.reverse()

let inputArr = readLine()!.split(separator: " ").map{ Int32($0)! }

var n = inputArr[0]
let k = inputArr[1]

var bottles = [Int32]()

makeArr(n)
bottles.sort(by: <)

guard bottles.count > k else {
    print(0)
    exit(EXIT_SUCCESS)
}

var new: Int32 = 0

addBottle()
print(new)

func makeArr(_ n: Int32) {
    for i in 0..<twoPowArr.count {
        if n == twoPowArr[i] {
            bottles.append(n)
            break
        } else if n < twoPowArr[i],
                  n > twoPowArr[i+1] {
            bottles.append(twoPowArr[i+1])
            makeArr(n-twoPowArr[i+1])
        }
    }
}

func addBottle() {
    while bottles.count > k {
        if bottles[0] == bottles[1] {
            bottles[0] *= 2
        } else {
            new += bottles[1] - bottles[0]
            bottles[0] = bottles[1]*2
        }
        bottles.remove(at: 1)
    }
}
