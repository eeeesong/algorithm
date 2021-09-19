# Perm Missing Elem

[Codility > Time Complexity > Perm Missing Element](https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/)



## 문제

An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

> ```
> class Solution { public int solution(int[] A); }
> ```

that, given an array A, returns the value of the missing element.

For example, given array A such that:

```
  A[0] = 2  A[1] = 3  A[2] = 1  A[3] = 5
```

the function should return 4, as it is the missing element.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [0..100,000];
> - the elements of A are all distinct;
> - each element of array A is an integer within the range [1..(N + 1)].





## 풀이

```swift
public func solution(_ A : inout [Int]) -> Int {
    var allNumbers = (1...1 + A.count).map { $0 }
    
    for number in A {
        let targetIndex = number - 1
        allNumbers[targetIndex] = -1
    }
    return allNumbers.filter { $0 != -1 }[0]
}
```

