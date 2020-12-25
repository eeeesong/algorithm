 ## QUIZ 6 - 콜라츠 추측

>    수학의 미해결 문제 중 하나로 콜라츠 추측(Collatz Congecture)이 있습니다.
>
>    ---------
>
>     **콜라츠 추측**
>
>     자연수 n에 대해,
>
>     \- n이 짝수인 경우, n을 2로 나눈다.
>
>     \- n이 홀수인 경우, n에 3을 곱해 1을 더한다.
>
>     위의 계산을 반복하면 초깃값이 어떤 수였더라도 반드시 1에 도달한다. 
>
>    -----------
>
>     이 내용을 조금 바꾸어 초깃값이 짝수면 맨 처음에만 n에 3을 곱하여 1을 더하는 것에서 시작하기로 하고, '맨 처음의 수'로 돌아가는 법을 생각해봅시다.
>
>      예를 들어 2로 시작하는 경우에는 다음과 같습니다.
>
>     2 -> 7 -> 22 -> 11 -> 34 -> 17 -> 52 -> 26 -> 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2
>
>     그러나 6으로 시작하면 다음과 같이 되어 6으로 되돌아가지 않습니다.
>
>     6 -> 19 -> 58 -> 29 -> 88 -> 44 -> 22 -> 11 -> 34 -> 17 -> 52 -> 26 -> 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 -> 4 -> ...
>
>     10,000 이하의 짝수 중 '처음으로 돌아가는 수'가 몇 개 있는지 구해보세요.

<br>

초보 마술(?) 중에 계산 몇번 시킨 다음에 지금 수 맞추는 트릭이 생각나는 문제다. (무슨 수로 시작했든 있든 6으로 끝났던 듯...) <br>

<br>

## 0️⃣ 콜라츠 추측

우선 콜라츠 추측을 구현해보았다. <br>

몇번만에 1이 되는지 카운트를 반환 값으로 삼아서 만들었다. 익숙해질 겸 재귀를 활용하여 작성. <br>

```swift
func collatz(_ startNum: Int,_ numberNow: Int,_ count: Int) -> Int {
    if numberNow == 1 {
        return 0
    } else if numberNow % 2 == 0 {
        return 1 + collatz(startNum, numberNow / 2, count+1)
    } else {
        return 1 + collatz(startNum, numberNow * 3 + 1, count+1)
    }
}

let n = 10
print("\(n)는 콜라츠 추측에 따르면 계산 \(collatz(n, n, 0))번만에 1이 된다")
//10는 콜라츠 추측에 따르면 계산 6번만에 1이 된다
```

<br>

<br>

## 1️⃣ 재귀 활용

오리지널 콜라츠 추측과 다른 점은 1이 아닌 원래의 수가 된다는 것이고, 원래의 수로 돌아가지 않을 수도 있다는 것이다. <br>

또한, 짝수인 경우에도 맨 처음엔 홀수의 계산법을 따른다. <br>

되돌아갈 수 있는지 없는지의 판단을 반환 값(Bool)으로 설정했다. 시작 시엔 당연히 시작 값과 같으므로, `count`가 0이 아닌 경우까지 추가하여 true를 리턴하도록 했다.

그리고 원래의 수로 되돌아가지 못하는 경우는 1이 나오는 경우로, 1이 산출될 경우 1 -> 4 -> 2 -> 1 -> 4...의 무한 사이클이 생성된다. 따라서 `numberNow`가 1이 되는 경우엔 false를 뱉어내는 것으로! 

```swift
func backToStartNum(_ startNum: Int,_ numberNow: Int,_ count: Int) -> Bool {
    if numberNow == startNum && count != 0 {
        return true
    } else if numberNow == 1 {
        return false
    } else if count == 0 || numberNow % 2 == 1{
        return backToStartNum(startNum, numberNow * 3 + 1, count+1)
    } else {
        return backToStartNum(startNum, numberNow / 2, count+1)
    }
}
```

<br>

1부터 10000사이의 짝수를 걸러내기 보다는 1부터 5000을 반복 범위로 설정한 뒤, 전달 시 2를 곱하여 짝수로 변환하는 방법을 택했다.

```swift
var answer = 0
for number in 1...5000 {
    if backToStartNum(number*2, number*2, 0) { answer += 1 }
}
print("정답은 \(answer)개") //정답은 34개
```

<br>

정답은 34개!

<br>

<br>

## 2️⃣ 반복문 활용

그런데 이 문제 같은 경우엔, 맨 처음엔 무조건 홀수의 규칙을 따른다는 조건이 있으며 1이 나올 시 변환에 실패하는 등 조건을 걸어줘야하는 경우가 많다. 또한, 카운트를 체크해줘야 하고 처음의 수도 저장을 해야하기 때문에 전달인자가 많아진다. <br>

그래서인지 책에서도 예시 답안에 반복문을 활용했고, 실제로 작성해보니 코드가 훨씬 깔끔하게 나왔다.<br>

```swift
func backToStartNum2(startNum: Int) -> Bool {
    
    var numberNow = startNum * 3 + 1
    
    while numberNow != 1, numberNow != startNum {
        let remainder = numberNow % 2
        numberNow = remainder == 0 ? numberNow/2 : numberNow * 3 + 1
    }
    
    return numberNow == 1 ? false : true
}
```

