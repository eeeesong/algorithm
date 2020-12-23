/*
 ✏️문제
 지폐를 넣으면 10원, 50원, 100원, 500원 동전으로 교환해주는 동전 교환기가 있습니다. 1000원 지폐를 넣었을 때 나오는 동전의 조합이 몇 가지인지 구해 보세요. 동전의 순서는 무시하기로 합니다. (단, 너무 많은 잔돈이 나오면 곤란하기 때문에 각 동전마다 최대 15개까지 환전할 수 있습니다)
 */

import Foundation

//반복문 활용
func exchange(money: Int, coins: [Int], maxCount: Int) -> Int {
    let coin = coins
    var max: [Int] = []
    for c in 0...coin.count-1 {
        let maxCount = money/coin[c] <= maxCount ? money/coin[c] : maxCount
        max.insert(maxCount, at: c)
    }
    return getExchangeWays(money, coin, max)
}

func getExchangeWays(_ money: Int,_ coin: [Int],_ max: [Int]) -> Int {
    var count = 0
    for i in 0...max[0] {
        for j in 0...max[1] {
            for k in 0...max[2] {
                for l in 0...max[3] {
                    let moneyNow = coin[0]*i + coin[1]*j + coin[2]*k + coin[3]*l
                    if moneyNow == money && i+j+k+l <= 15 {
                        count += 1
                    }
                }
            }
        }
    }
    return count
}

exchange(money: 1000, coins: [500,100,50,10], maxCount: 15)


//재귀 활용



