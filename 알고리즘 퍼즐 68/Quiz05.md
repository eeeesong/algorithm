 ## QUIZ 5 - 아직도 현금으로 계산하다니!

>    지폐를 넣으면 10원, 50원, 100원, 500원 동전으로 교환해주는 동전 교환기가 있습니다. 1000원 지폐를 넣었을 때 나오는 동전의 조합이 몇 가지인지 구해 보세요. 동전의 순서는 무시하기로 합니다.
>
>    (단, 너무 많은 잔돈이 나오면 곤란하기 때문에 각 동전마다 최대 15개까지 환전할 수 있습니다)

<br>

하.. 이 문제를 3일 잡고 있었는데 결국 재귀를 통해서는 구현해내지 못했다... 나중에 다시 돌어와서 시도해봐야 겠다.<br>

우선은 내가 구현한 반복문을 통한 풀이. <br>

환전 경우의 수를 구하기 전, 투입되는 지폐의 금액에 따라 각 동전의 최대 환전 수가 몇개인지 구하기 위해 `exchange` 함수를 정의해주었다. 최대 15개까지 사용 가능하나, 500원처럼 단위가 큰 경우 15개까지 사용이 불가하므로 3항 연산자로 `maxCount`를 계산했다.

```swift
func exchange(money: Int, coins: [Int], maxCount: Int) -> Int {
    let coin = coins
    var max: [Int] = []
    for c in 0...coin.count-1 {
        let maxCount = money/coin[c] <= maxCount ? money/coin[c] : maxCount
        max.insert(maxCount, at: c)
    }
    return getExchangeWays(money, coin, max)
}
```

<br>

그리고 최댓값에 따라 반복문의 범위를 설정해주고, 잔돈들이 구성한 `moneyNow`가 `money`와 같다면 `count + 1`.

```swift
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

exchange(money: 1000, coins: [500,100,50,10], maxCount: 15) //20
```

<br>

1000원을 넣으면 총 20가지의 경우의 수가 나온다..! <br>

이제 문제의 재귀. 아래는 책에서 제시하고 있는 파이썬으로 구현한 재귀 풀이이다. <br>

이 풀이를 그대로 swift로 옮겨 보려 시도했는데, index 오류가 나거나 전혀 다른 답이 나온다.

```python
from collections import deque

cnt = 0
def change(target, coins, usable):
  global cnt
  coin = coins.popleft()
  if len(coins) == 0:
    if target // coin <= usable:
      cnt += 1
  else:
    for i in range(0, target // coin + 1):
      change(target - coin * i, coins.copy(), usable - i)

change(1000, deque([500, 100, 50, 10]), 15)
print(cnt) //20
```

<br>

우선은 넘어가고.. i will be back 😬

