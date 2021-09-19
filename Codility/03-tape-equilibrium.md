# TAPE EQUILIBRIUM

[Codility > Time Complexity](https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/)



## 문제

A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

The *difference* between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

For example, consider array A such that:

```
  A[0] = 3  A[1] = 1  A[2] = 2  A[3] = 4  A[4] = 3
```

We can split this tape in four places:

> - P = 1, difference = |3 − 10| = 7 
> - P = 2, difference = |4 − 9| = 5 
> - P = 3, difference = |6 − 7| = 1 
> - P = 4, difference = |10 − 3| = 7 

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

For example, given:

```
  A[0] = 3  A[1] = 1  A[2] = 2  A[3] = 4  A[4] = 3
```

the function should return 1, as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [2..100,000];
> - each element of array A is an integer within the range [−1,000..1,000].



## 풀이

- 배열을 두 부분으로 나눴을 때, 각 배열 합의 차이가 최소로 나타나는 지점을 구하시오
- [0..<P] / [P..<count-1]



## First Try 

- O(N*N)으로 시간초과 

```swift
public func solution(_ A : inout [Int]) -> Int {
    var minimum = Int.max
    let lastIndex = A.count - 1
    
    for p in 1...lastIndex {
        let frontPart = A[0..<p].reduce(0,+)
        let backPart = A[p...lastIndex].reduce(0,+)
        let diff = abs(frontPart - backPart)
        
        if diff < minimum {
            minimum = diff
        }
    }
    return minimum
}
```

-> reduce는 O(N)임! 



## Second Try 

- 매번 합을 구할 필요가 없음
- 앞 뒤로 현재 값을 빼고 더해주기만 하면 됨
- 양쪽 테이프에 적어도 값 1개씩은 남아있어야 함에 유의.

```swift
public func solution(_ A : inout [Int]) -> Int {
    var frontPart = 0
    var backPart = A.reduce(0,+)
    var minimumDiff = Int.max
    
    for i in 0..<A.count-1 {
        let currentNumber = A[i]
        frontPart += currentNumber
        backPart -= currentNumber
        let currentDiff = abs(frontPart - backPart)
        
        if currentDiff < minimumDiff {
            minimumDiff = currentDiff
        }
    }
    return minimumDiff
}
```

