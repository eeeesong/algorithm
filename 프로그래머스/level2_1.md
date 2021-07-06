# 큰 수 만들기

[프로그래머스 2단계 - 큰 수 만들기](https://programmers.co.kr/learn/courses/30/lessons/42883?language=swift)



## 문제

###### 문제 설명

어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.

예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.

문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다. number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.

##### 제한 조건

- number는 1자리 이상, 1,000,000자리 이하인 숫자입니다.
- k는 1 이상 `number의 자릿수` 미만인 자연수입니다.

##### 입출력 예

| number       | k    | return   |
| ------------ | ---- | -------- |
| "1924"       | 2    | "94"     |
| "1231234"    | 3    | "3234"   |
| "4177252841" | 4    | "775841" |





## 풀이

- 10번에서 시간초과가 뜨는 풀이

```swift
func solution(_ number:String, _ k:Int) -> String {
    let count = number.count
    let digit = count-k
    let allNumbers = number.reversed().map{ Int(String($0))! }
    
    var pickedNumbers = (0..<digit).map{ allNumbers[$0] }
    var indexToEnd = count-1
    var numberChanged = false
    
    for d in 0..<digit {
        let indexToStart = digit-d-1
        
        guard indexToEnd >= indexToStart else { break }
        
        numberChanged = false
        var currentNumber = pickedNumbers[indexToStart]

        for index in indexToStart...indexToEnd {
            let newNumber = allNumbers[index]
            if newNumber >= currentNumber {
                currentNumber = newNumber
                indexToEnd = index-1
                numberChanged = true
            }
        }
        
        if !numberChanged { indexToEnd = indexToStart }
        pickedNumbers[indexToStart] = currentNumber
    }
    return pickedNumbers.map{ String($0) }.reversed().joined()
}
```

