# Missing Integer

[Counting Elements > Missing Integer](https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/)



## 문제 

This is a demo task.

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [1..100,000];
> - each element of array A is an integer within the range [−1,000,000..1,000,000].



## 풀이 

- 등장하지 않는 최솟값 리턴

```swift
public func solution(_ A : inout [Int]) -> Int {
    let numbers = Set(A).filter { $0 > 0 }.sorted(by: <)
    
    guard !numbers.isEmpty else {
        return 1
    }
    
    var guess = 1
    
    for number in numbers {
        if guess == number {
            guess += 1
        } else {
            return guess
        }
    }
    return guess
}
```



- 별 차이는 없지만

```swift
public func solution(_ A : inout [Int]) -> Int {
    let sorted = Set(A).sorted(by: <).filter{ $0 > 0 }
    
    guard !sorted.isEmpty else {
        return 1
    }
    
    let largest = sorted.last!

    for guess in 1...largest {
        let index = guess - 1
      
        if sorted[index] != guess {
            return guess
        }
    }
    return largest + 1
}
```







