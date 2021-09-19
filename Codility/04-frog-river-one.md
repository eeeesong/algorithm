# Frog River One

[Codility > Counting Elements](https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/)



## 문제

A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.

You are given an array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.

The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.

For example, you are given integer X = 5 and array A such that:

```
  A[0] = 1  A[1] = 3  A[2] = 1  A[3] = 4  A[4] = 2  A[5] = 3  A[6] = 5  A[7] = 4
```

In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.

Write a function:

> ```
> public func solution(_ X : Int, _ A : inout [Int]) -> Int
> ```

that, given a non-empty array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.

If the frog is never able to jump to the other side of the river, the function should return −1.

For example, given X = 5 and array A such that:

```
  A[0] = 1  A[1] = 3  A[2] = 1  A[3] = 4  A[4] = 2  A[5] = 3  A[6] = 5  A[7] = 4
```

the function should return 6, as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N and X are integers within the range [1..100,000];
> - each element of array A is an integer within the range [1..X].



## 풀이 

### First Try

```swift
public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var leaves = Array(repeating: 0, count: X)

    for i in 0..<A.count {
        let leaf = A[i]
        let realIndex = leaf - 1
        leaves[realIndex] += 1
        
        if leaves.filter({ $0 == 0 }).isEmpty {
            return i
        }
    }
    return -1
}
```

- O(N<sup>2</sup>)로 시간초과가 뜬다



### Second Try

- 시간 초과를 해결해보자.
- 값이 없는 경우 max 확인을 통한 빠른 종료
- filter 대신 **Set 활용** <----- Set을 기억하자!!!!

```swift
public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    guard let max = A.max(), max >= X else {
        return -1
    }
    
    var leaves = Set((1...X).map { $0 })

    for i in 0..<A.count {
        let leaf = A[i]
        leaves.remove(leaf)
        
        if leaves.isEmpty {
            return i
        }
    }
    return -1
}
```

