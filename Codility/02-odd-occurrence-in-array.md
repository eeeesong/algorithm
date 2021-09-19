# Odd Occurrence In Array

[Codility > Arrays > Odd Occurrence In Array](https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/)



## 문제 

A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.

For example, in array A such that:

```
  A[0] = 9  A[1] = 3  A[2] = 9  A[3] = 3  A[4] = 9  A[5] = 7  A[6] = 9
```

> - the elements at indexes 0 and 2 have value 9,
> - the elements at indexes 1 and 3 have value 3,
> - the elements at indexes 4 and 6 have value 9,
> - the element at index 5 has value 7 and is unpaired.

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.

For example, given array A such that:

```
  A[0] = 9  A[1] = 3  A[2] = 9  A[3] = 3  A[4] = 9  A[5] = 7  A[6] = 9
```

the function should return 7, as explained in the example above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an odd integer within the range [1..1,000,000];
> - each element of array A is an integer within the range [1..1,000,000,000];
> - all but one of the values in A occur an even number of times.



## 풀이

- 짝 지어지지 않는 element를 구하라
- not sorted, not empty, 단 하나의 요소가 홀수 번 나타난다
- 완전 탐색을 할 수 밖에..?
  - **정렬 후 탐색하여 홀수면 바로 리턴**
  - 하나하나 딕셔너리에 넣은 뒤 홀수 찾아서 리턴

```swift
public func solution(_ A : inout [Int]) -> Int {
    guard A.count != 1 else {
        return A[0]
    }
    
    A.sort(by: <)
    
    var pastNumber = A[0]
    var isCountOdd = true
    
    for i in 1..<A.count {
        let currentNumber = A[i]
        
        if currentNumber == pastNumber {
            isCountOdd.toggle()
        } else {
            if isCountOdd {
                return pastNumber
            } else {
                pastNumber = currentNumber
                isCountOdd = true
            }
        }
    }
    return A.last!
}
```



### Swift sort / sorted의 시간복잡도

- Swift의 Sort는 Time Sort로 구현되어 있다고 한다.
  - 타임 소트 : 머지 소트 + 인서트 소트가 합쳐진 불안정 정렬 ([참고](https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=talag&logNo=221020181491))
- O(N logN)의 시간복잡도