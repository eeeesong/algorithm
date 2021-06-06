# 직사각형 별찍기

[프로그래머스 1단계 - 직사각형 별찍기](https://programmers.co.kr/learn/courses/30/lessons/12969?language=swift)



### 문제

###### 문제 설명

이 문제에는 표준 입력으로 두 개의 정수 n과 m이 주어집니다.
별(*) 문자를 이용해 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 출력해보세요.

------

##### 제한 조건

- n과 m은 각각 1000 이하인 자연수입니다.

------

##### 예시

입력

```
5 3
```

출력

```
*****
*****
*****
```



### 풀이

```swift
import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
let star = Array(repeating: "*", count: a).reduce("",+)

for i in 1...b {
    print(star)
}
```



#### 특정 문자가 반복된 문자열을 만드는 방법?

- Array(repeating: , count:)로 반복 배열 만든 뒤 합치기
  - reduce( , )
  - joined() -> 문자열 연결에 최적! seperator를 설정할 수도 있다
- **String(repeating:, count:)** 사용
  - String 이니셜라이저에도 같은 문자를 반복하는 것이 있다



