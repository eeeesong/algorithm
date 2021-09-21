# MIN AVG TWO SLICE

[prefix sums > min average two slice](https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/)



## 문제

A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a *slice* of array A (notice that the slice contains at least two elements). The *average* of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

For example, array A such that:

```
    A[0] = 4    A[1] = 2    A[2] = 2    A[3] = 5    A[4] = 1    A[5] = 5    A[6] = 8
```

contains the following example slices:

> - slice (1, 2), whose average is (2 + 2) / 2 = 2;
> - slice (3, 4), whose average is (5 + 1) / 2 = 3;
> - slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.

The goal is to find the starting position of a slice whose average is minimal.

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

For example, given array A such that:

```
    A[0] = 4    A[1] = 2    A[2] = 2    A[3] = 5    A[4] = 1    A[5] = 5    A[6] = 8
```

the function should return 1, as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [2..100,000];
> - each element of array A is an integer within the range [−10,000..10,000].



## 풀이

### First Try

- 최소 평균이 나오는 범위를 찾으면 된다
- 앞에서부터 누적 합을 구한 뒤, 각 인덱스를 활용하여 평균내본다.
- 그 중 가장 낮은 평균이 나온 인덱스를 추출한다.
- 그 인덱스를 기준으로 앞에서부터 하나씩 값을 빼 평균을 구했을 때, 최소가 나오는 지점을 리턴한다.

```swift
public func solution(_ A : inout [Int]) -> Int {
    let count = A.count
    var minimumAverageIndex = -1
    var minimumAverage = Double(Int.max)
    var minimumPartialSum = Double(Int.max)
    var partialAverage = Array(repeating: Double(A[0]), count: count)
    
    for i in 1..<count {
        let prevSum = partialAverage[i - 1] * Double(i)
        let currentSum = prevSum + Double(A[i])
        partialAverage[i] = Double(currentSum) / Double(i + 1)
        
        if partialAverage[i] < minimumAverage {
            minimumAverageIndex = i
            minimumAverage = partialAverage[i]
            minimumPartialSum = currentSum
        }
    }
    
    var minimumStarter = 0
    var partialSum: Double = 0
    var partialMinimumAverage = minimumAverage
    
    for j in 0..<minimumAverageIndex - 1 {
        let divider = (minimumAverageIndex + 1) - j
        partialSum += Double(A[j])
        let newAverage = (minimumPartialSum - partialSum) / Double(divider)
        
        if newAverage < partialMinimumAverage {
            partialMinimumAverage = newAverage
            minimumStarter = j + 1
        }
    }
    return minimumStarter
}
```

- 30점으로 장렬히 실패...
- 시간 복잡도 문제가 아니라 그냥 답이 틀렸다.



### Second Try

- 음수가 있는 경우 평균 값의 편차 흐름이 달라질 수 있어서 위의 방식은 무용지물...
- O(n<sup>2</sup>)으로 풀 순 있겠지만 시간 초과가 걸릴 것.
- 모르겠어서 구글링 [참고](https://codesays.com/2014/solution-to-min-avg-two-slice-by-codility/)
  - 요점만 뽑자면, 2개 혹은 3개 원소의 평균만 체크하면 된다.
  - 평균을 내는 원소가 몇개든, 최소 평균 단위가 있어야만 최소 평균이 될 수 있다.

```swift
public func solution(_ A : inout [Int]) -> Int {
    let lastIndex = A.count - 1
    
    guard lastIndex > 1 else {
        return 0
    }
    
    var minimumAverageIndex = 0
    var minimumAverage = Double(A[0] + A[1]) / 2
    
    for i in 1..<lastIndex {
        let averageTwo = Double(A[i] + A[i+1]) / 2
        
        if averageTwo < minimumAverage {
            minimumAverageIndex = i
            minimumAverage = averageTwo
        }
        
        let averageThree = Double(A[i-1] + A[i] + A[i+1]) / 3
        
        if averageThree < minimumAverage {
            minimumAverageIndex = i - 1
            minimumAverage = averageThree
        }
    }
    return minimumAverageIndex
}
```



