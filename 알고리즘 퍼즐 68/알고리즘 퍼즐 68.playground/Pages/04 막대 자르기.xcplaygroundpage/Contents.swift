/*
 ✏️문제
 길이 n[cm]의 한 막대를 1[cm]단위로 자른다고 생각해 봅시다. 단, 하나의 막대는 한 번에 한 사람만이 자를 수 있습니다. 잘린 막대가 3개가 되면, 동시에 3명이 자를 수 있습니다.
 최대 m명이 있을 때 막대를 자르는 최소 횟수를 구해 보세요. 예를 들어 n=8, m=3일 땐 4번으로 자를 수 있습니다.
 
 n=20, m=3일 때의 횟수를 구해 보세요.
 n=100, m=5일 때의 횟수를 구해 보세요.
 */

import Foundation

//현실을 곧이 곧대로 반영하여 구현
func cutBar(length: Int, manPow: Int) -> Int {
    var cutCount = 0
    var bars: [Int] = [length]

    while !bars.isEmpty {
        cutCount += 1
        let cutBy = manPow <= bars.count ? manPow : bars.count

        for cut in 1...cutBy {
            if bars[cut-1] == 3 {
                bars.append(2)
            } else if bars[cut-1] > 2 {
                let temp = bars[cut-1]/2
                bars.append(temp)
                bars[cut-1]%2 == 0 ? bars.append(temp) : bars.append(temp+1)
            }
            bars[cut-1] = 0
        }

        bars = bars.filter{ $0 != 0 }
    }
    return cutCount
}

cutBar(length: 20, manPow: 3) //8
cutBar(length: 100, manPow: 5) //22


//재귀 사용
func cutBar2(_ manPow: Int,_ length: Int,_ current: Int) -> Int {
    if current >= length {
        return 0
    } else if current < manPow {
        return 1 + cutBar2(manPow, length, current * 2)
    } else {
        return 1 + cutBar2(manPow, length, current + manPow)
    }
}

cutBar2(3, 20, 1) //8
cutBar2(5, 100, 1) //22

//1의 막대를 m으로 결합하여 n막대를 만드는 방식
func cutBar3(_ manPow: Int, _ length: Int) -> Int {
    var count = 0
    var current = 1
    while length > current {
        current += current < manPow ? current : manPow
        count += 1
    }
    return count
}

cutBar3(3, 20) //8
cutBar3(5, 100) //22
