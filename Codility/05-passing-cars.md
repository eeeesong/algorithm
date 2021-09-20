# Passing Cars 

[Prefix Sums > Passing Cars](https://app.codility.com/programmers/lessons/5-prefix_sums/passing_cars/)



## 문제

A non-empty array A consisting of N integers is given. The consecutive elements of array A represent consecutive cars on a road.

Array A contains only 0s and/or 1s:

> - 0 represents a car traveling east,
> - 1 represents a car traveling west.

The goal is to count passing cars. We say that a pair of cars (P, Q), where 0 ≤ P < Q < N, is passing when P is traveling to the east and Q is traveling to the west.

For example, consider array A such that:

```
  A[0] = 0  A[1] = 1  A[2] = 0  A[3] = 1  A[4] = 1
```

We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given a non-empty array A of N integers, returns the number of pairs of passing cars.

The function should return −1 if the number of pairs of passing cars exceeds 1,000,000,000.

For example, given:

```
  A[0] = 0  A[1] = 1  A[2] = 0  A[3] = 1  A[4] = 1
```

the function should return 5, as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [1..100,000];
> - each element of array A is an integer that can have one of the following values: 0, 1.





## 풀이 

- **0**: 동쪽으로 이동 
- **1**: 서쪽으로 이동
- passing하게 되는 차 쌍의 개수를 리턴하라

- 1,000,000,000 건 이상의 passing이 발생하면 -1을 리턴해야한다

- 먼저 지나간 차와는 passing할 수 없으므로, 경우의 수를 구하는 공식으로는 답을 낼 수 없다

```swift
public func solution(_ A : inout [Int]) -> Int {
    let maximum = 1000000000
    var passingCount = 0
    var partialSum = 0
    A = A.reversed()
    
    for car in A {
        if car == 1 {
            partialSum += 1
        } else {
            passingCount += partialSum
        }
        
        if passingCount > maximum {
            return -1
        }
    }
    return passingCount
}
```

- 뒤부터 부분합을 구해 차례로 더하면 된다.



