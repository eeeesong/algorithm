## 	QUIZ 2 - 수열의 사칙 연산

>   여기서는 나열된 각 숫자 사이에 사칙연산의 연산자를 넣어 계산해보기로 합니다. (모든 숫자 사이에 연산자를 넣지는 않아도 되지만, 전체에서 최소한 하나는 넣어야 함)
>
>  완성된 식을 계산한 결과 '원래 수를 거꾸로 나열한 숫자'가 되는 것을 생각해 보겠습니다. 계산 순서는 수학에서 통용되는 순서를 따릅니다.
>
>   예) 	  351 -> 3 x 51 = 153
>
>  ​			621 -> 6 x 21 = 126
>
>  ​    		886 -> 8 x 86 = 688
>
>    1,000 ~ 9,999 중 위의 조건을 만족하는 수를 구해 보세요.

<br>

사칙연산이 조건이긴 하지만, 계산 후 4자리 수이려면 곱셈 외의 연산 기호는 사용될 수 없다.

<br>

우선, `getCalc`라는 이름으로 함수를 만들고 매개변수로는 Int를 전달 받고 Bool을 반환하는 것으로 했다. 반환이 true일 경우에만 문제 조건에 걸맞은 수라는 의미로.  <br>

그리고 제일 먼저 현재 수와 그것의 반대를 각각 String으로 바꿔주었다.

```swift
func getCalc(for n: Int) -> Bool {

    var numberInString = String(n)
    let reversedNumberInString = String(numberInString.reversed())
    ...
```

<br>

위에서 말한 것처럼, 사칙연산 중 곱셈과 연산을 하지 않는 경우 두가지만 존재하므로 해당 기호를 담은 배열을 만들어 주었다. <br>

또한, 뒤이어 나올 반복문을 위해 `last`, `numberInArray` 지정.

```swift
		...
		let operation = ["*",""]
    let last = operation.count-1
    let numberInArray = numberInString.map{ String($0) }
		...
```

<br>

그리고 뒤이어지는 코드는 다음과 같은데, for 문 3중중첩이 정말 마음에 들지 않지만... 우선은 머리를 굴려봐도 별다른 수가 없어서 이대로 두었다. 크게 아래의 세 파트로 나뉜다. <br>

> 1️⃣ - 각 숫자 사이에 사칙연산 부호를 넣은 `calculation` 을 생성한다
>
> 2️⃣ - `calculation`에 사칙연산 부호가 하나라도 들어가 있다면, NSExpression을 활용하여 계산을 진행한다.
>
> 3️⃣ - 결과가 맞아 떨어진다면 계산식을 프린트 후 true를 반환한다.

```swift
    ...
		// 1️⃣
		for a in 0...last {
        for b in 0...last {
            for c in 0...last {
                let calculation =
                    numberInArray[0] + operation[a] +
                    numberInArray[1] + operation[b] +
                    numberInArray[2] + operation[c] + numberInArray[3]
                
                // 2️⃣
                if calculation.count != 4 {
                    let calcNumber = NSExpression(format: calculation)
                    let newNumber = calcNumber.expressionValue(with: nil, context: nil) as? Int
                    numberInString = String(newNumber!)
                  
                    // 3️⃣
                    if numberInString == reversedNumberInString {
                        print("\(n) -> \(calculation) = \(numberInString)")
                        return true
                    }
                }
            }
        }
    }
    return false
}
```

<br>

캐릭터 단위로 하나씩 분리하여 계산을 진행하는 방법도 있겠지만, swift에는 계산 식으로 쓰인 String을 읽어와 쓰인대로 계산을 해주는 메소드가 존재하더라! Wow! (정보는 [이곳](https://nshipster.com/nsexpression/)에서 얻었다.) <br>

<br>

그리고 1000부터 차례로 함수를 실행해주면, 최종 결과 배열엔 달랑 5931만이 들어있는 것을 알 수 있다.<br>

```swift
var number = 1000
var result: [Int] = []

while number < 10000 {
    if getCalc(for: number) { result.append(number) }
    number += 1
}

print(result)
// 5931 -> 5*9*31 = 1395
// [5931]
```

<br>

문제를 다시 잘 읽어보니 애초에 하나의 값이 답으로 나온다고 쓰여 있어서 굳이 배열로 반환하지 않아도 됐지만... 언젠가 다른 범위의 수로 테스트해본다면 그땐 의미가 있겟지!!