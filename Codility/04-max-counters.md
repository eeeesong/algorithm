# Max Counters

[Counting Elements > Max Counters](https://app.codility.com/programmers/lessons/4-counting_elements/max_counters/)



## 문제

You are given N counters, initially set to 0, and you have two possible operations on them:

> - *increase(X)* − counter X is increased by 1,
> - *max counter* − all counters are set to the maximum value of any counter.

A non-empty array A of M integers is given. This array represents consecutive operations:

> - if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
> - if A[K] = N + 1 then operation K is max counter.

For example, given integer N = 5 and array A such that:

```
    A[0] = 3    A[1] = 4    A[2] = 4    A[3] = 6    A[4] = 1    A[5] = 4    A[6] = 4
```

the values of the counters after each consecutive operation will be:

```
    (0, 0, 1, 0, 0)    (0, 0, 1, 1, 0)    (0, 0, 1, 2, 0)    (2, 2, 2, 2, 2)    (3, 2, 2, 2, 2)    (3, 2, 2, 3, 2)    (3, 2, 2, 4, 2)
```

The goal is to calculate the value of every counter after all operations.

Write a function:

> ```
> public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
> ```

that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.

Result array should be returned as an array of integers.

For example, given:

```
    A[0] = 3    A[1] = 4    A[2] = 4    A[3] = 6    A[4] = 1    A[5] = 4    A[6] = 4
```

the function should return [3, 2, 2, 4, 2], as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N and M are integers within the range [1..100,000];
> - each element of array A is an integer within the range [1..N + 1].



## 풀이 

- 주어진 배열의 값이 1과 N 사이에 있으면 해당 값의 인덱스에 +1,
- N+1이면 모든 값을 현재의 최대치로 바꾼다



### First Try

```swift
public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var result = Array(repeating: 0, count: N)
    var maxCounter = 0

    A.forEach { counter in
        if counter <= N {
            let realIndex = counter - 1
            result[realIndex] += 1
            
            if result[realIndex] > maxCounter {
                maxCounter = result[realIndex]
            }
        } else {
            result = Array(repeating: maxCounter, count: N)
        }
    }
    return result
}
```

- O(N + M)
- 모든 연산이 max counter인 테스트케이스에서만 시간초과가 났다.



### Second Try 

```swift
public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var result = Array(repeating: 0, count: N)
    var prevMaxCounter = 0
    var currentMaxCounter = 0

    A.forEach { counter in
        if counter <= N {
            let realIndex = counter - 1
            result[realIndex] += 1
            
            if result[realIndex] > currentMaxCounter {
                currentMaxCounter = result[realIndex]
            }
        } else {
            if prevMaxCounter < currentMaxCounter {
                result = Array(repeating: currentMaxCounter, count: N)
                prevMaxCounter = currentMaxCounter
            }
        }
    }
    return result
}
```

- 이전의 maxCounter를 저장하고, 변화가 없을 시 바꾸지 않음으로써 시간 초과 해결