 ## QUIZ 4 - 막대 자르기

>    길이 n[cm]의 한 막대를 1[cm]단위로 자른다고 생각해 봅시다. 단, 하나의 막대는 한 번에 한 사람만이 자를 수 있습니다. 잘린 막대가 3개가 되면, 동시에 3명이 자를 수 있습니다.
>
>    최대 m명이 있을 때 막대를 자르는 최소 횟수를 구해 보세요. 예를 들어 n=8, m=3일 땐 4번으로 자를 수 있습니다.
>
>    n=20, m=3일 때,  n=100, m=5일 때의 횟수를 구해 보세요.

<br>

내 능력 안에선 심플하게 구현할 방법이 마땅치 않아서 고민이 많았다. <br>

우선 되는대로 구현을 한 코드. 굉장히 현실 반영(?)이 잘 되어 있는 코드다. 막대를 나누는 과정을 세세히 들여다볼 수 있는ㅎ...<br>나눈 막대를 배열에 때려 넣고, 1이면 아예 추가를 하지 않는 방식. 나누기 완료한 막대를 바로 삭제해버리면 index 오류가 나기 때문에 0으로 채운 다음 filter를 해야만 했다. filter에 굉장히 많은 시간이 소요되어 버린다. <br>

```swift
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
```

<br>

어찌 저찌 답은 나오지만 전혀 아름답지 않다. <br>

책에서 제시한 풀이 방식은 다음의 두가지다. 두 방식 모두 굉장히 간결하다. <br>

<br>

### 1️⃣ 재귀 사용

책에 쓰여 있는 파이썬 코드를 swift 버전으로 그대로 옮긴 것이다. <br>

재귀 알고리즘은 개념만 알뿐 아직 제대로 구현해본 적이 없어서 완전히 이해하는 데에 시간이 조금 걸렸다. 반환 값으로 뭐가 나오게 되는 건지가 헷갈렸다. 1 + 1 + 1 + .... + 0이 반환되기 때문에 곧 else if/ else를 거쳐간 횟수가 답이 되는 것이었다..! <br>

그리고 나눈 횟수만 구하면 되기 때문에, 현재 막대의 수를 나타내는 `current`가 전체 길이인 `length` 보다 같거나 크게 되는 상황만 체크하면 된다. 노동자의 수가 막대 수보다 적은 경우 모두가 막대를 반으로 나누므로 `current * 2`를, 막대 수가 더 많다면 인력만큼만 나눌 수 있기 때문에 `current + manPow`를 하면 깔-끔.

```swift
func cutBar(_ manPow: Int,_ length: Int,_ current: Int) -> Int {
    if current >= length {
        return 0
    } else if current < manPow {
        return 1 + cutBar(manPow, length, current * 2)
    } else {
        return 1 + cutBar(manPow, length, current + manPow)
    }
}

cutBar(3, 20, 1) //8
cutBar(5, 100, 1) //22
```

<br>

### 2️⃣ 1의 막대를 m으로 결합하여 n막대를 만드는 방식

이 소제목은 책에 쓰인 문구를 거의 그대로 가져온 것인데 솔직히 말해 아직도 제대로 이해가 되지 않는다. 번역이 문제일까 내가 문제일까? <br>

여튼간에 코드를 들여다 보면 다음과 같다. 이 코드 역시 파이썬으로 쓰인 것을 swift로 그대로 옮겨온 것인데, if 문 부분만 3항 연산 형태로 바꿨다. <br>

로직을 찬찬히 들여다 보면 사실 위에서 재귀로 작성한 것과 굉장히 흡사하다. `current`와 `manPow`를 비교하고 `current`를 2배로 불리거나 `manPow`만큼 증가시킨다. 그리고 실행될 때마다 `count += 1`을 하여 최종적으로 `count`를 반환하는 것이니, 위에서 재귀를 통해 반환시  +1를 한 것을 `count`라는 변수로 옮겨온 것의 차이가 있을 뿐이다. <br>

```swift
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
```

<br>

인간의 개념으로 이해하자면 1️⃣에서는 `current`의 의미가 **막대의 개수**이며, 2️⃣에서는 **막대의 길이**인 셈이다. 그러나 최종적으로 자르려는 길이도 1, 개수를 세는 단위도 1이기 때문에 두 해법에 큰 차이가 없어 보이는 것.<br>

다소 어렵다...





