# COUNT DIV

[Prefix sums > Count Div](https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/)



## 문제

Write a function:

> ```
> public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int
> ```

that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:

> { i : A ≤ i ≤ B, i **mod** K = 0 }

For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - A and B are integers within the range [0..2,000,000,000];
> - K is an integer within the range [1..2,000,000,000];
> - A ≤ B.





## 풀이

- A와 B 사이의 수 중, K로 나뉘는 수의 개수

- (B - A) / K + A로 K를 나눴을 때 / B로 K를 나눴을 때 나누어 떨어진다면 각각 +1

-> 이렇게 풀면 안됨! 

- 최소 값이 작아져서 그보다 큰 수로 나눌 때 결과 값이 달라질 수 있다.

```swift
public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    guard A != B else {
        return A % K == 0 ? 1 : 0
    }
    let highCount = B / K
    let lowCount = A / K
    let edgeCount = A % K == 0 ? 1 : 0
    return highCount - lowCount + edgeCount
}
```

- 높은 범위에서 낮은 범위의 개수를 빼줄 때, 낮은 범위의 수도 나누어 떨어진다면 같이 빠지게 되므로 필요할 경우 1을 더해주어야 한다

