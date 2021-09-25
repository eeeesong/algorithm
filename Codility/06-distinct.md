# Distinct

[Sorting > Easy > Distinct](https://app.codility.com/programmers/lessons/6-sorting/distinct/)



## 문제

Write a function

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given an array A consisting of N integers, returns the number of distinct values in array A.

For example, given array A consisting of six elements such that:

```
 A[0] = 2    A[1] = 1    A[2] = 1 A[3] = 2    A[4] = 3    A[5] = 1
```

the function should return 3, because there are 3 distinct values appearing in array A, namely 1, 2 and 3.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [0..100,000];
> - each element of array A is an integer within the range [−1,000,000..1,000,000].



## 풀이

- 배열에 포함된 숫자의 종류 개수를 구하라

```swift
public func solution(_ A : inout [Int]) -> Int {
    return Set(A).count
}
```

...문제의 의도가 따로 있는 걸까..?