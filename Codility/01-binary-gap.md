# Binary Gap

[Codility Lesson 1 Iterations > Binary Gap](https://app.codility.com/programmers/lessons/1-iterations/binary_gap/)



## 문제

A *binary gap* within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation `1001` and contains a binary gap of length 2. The number 529 has binary representation `1000010001` and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation `10100` and contains one binary gap of length 1. The number 15 has binary representation `1111` and has no binary gaps. The number 32 has binary representation `100000` and has no binary gaps.

Write a function:

> ```
> public func solution(_ N : Int) -> Int
> ```

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation `10000010001` and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [1..2,147,483,647].



## 풀이

```swift
public func solution(_ N : Int) -> Int {
    let binaryString = binary(from: N)
    
    var maxCount = 0
    var currentCount: Int? = nil
    
    for character in binaryString {
        if character == "1" {
            if let currentCount = currentCount, currentCount >= maxCount {
                maxCount = currentCount
            }
            currentCount = 0
        } else {
            if currentCount != nil {
                currentCount! += 1
            }
        }
    }
    return maxCount
}

func binary(from number: Int) -> String {
    var binaryString = ""
    var number = number
    
    while number > 1 {
        binaryString += String(number % 2)
        number = number / 2
    }
    binaryString += "1"
    return binaryString
}
```

- 앞뒤에 1이 없으면 gap으로 인정하지 않는다.
- 최고자리수는 반드시 1로 끝나야하므로, 끝 부분의 1은 따로 처리를 하지 않아도 됨.
- 시작하는 자리수에서 1이 등장하지 않는 경우를 판별하기 위하여 nil 도입.
- 1이 등장한 경우에만 카운트함