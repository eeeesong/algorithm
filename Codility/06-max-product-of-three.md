# Max Product Of Three

[Sorting > Easy > Max Product Of Three](https://app.codility.com/programmers/lessons/6-sorting/max_product_of_three/)



## 문제

A non-empty array A consisting of N integers is given. The *product* of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).

For example, array A such that:

```
  A[0] = -3  A[1] = 1  A[2] = 2  A[3] = -2  A[4] = 5  A[5] = 6
```

contains the following example triplets:

> - (0, 1, 2), product is −3 * 1 * 2 = −6
> - (1, 2, 4), product is 1 * 2 * 5 = 10
> - (2, 4, 5), product is 2 * 5 * 6 = 60

Your goal is to find the maximal product of any triplet.

Write a function:

> ```
> public func solution(_ A : inout [Int]) -> Int
> ```

that, given a non-empty array A, returns the value of the maximal product of any triplet.

For example, given array A such that:

```
  A[0] = -3  A[1] = 1  A[2] = 2  A[3] = -2  A[4] = 5  A[5] = 6
```

the function should return 60, as the product of triplet (2, 4, 5) is maximal.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [3..100,000];
> - each element of array A is an integer within the range [−1,000..1,000].



## 풀이

```swift
public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 3 else {
        return A.reduce(1, *)
    }
    var negatives = [Int]()
    var positives = [Int]()
    
    for number in A {
        number >= 0 ? addPositives(number, to: &positives) : addNegatives(number, to: &negatives)
    }
    let negativeTriple = negatives.count == 3 ? [negatives.reduce(1, *)] : []
    let positiveTriple = positives.count == 3 ? [positives.reduce(1, *)] : []
    let combinedTriples = combines(of: negatives, positives)
    return (negativeTriple + positiveTriple + combinedTriples).max() ?? 0
}

func addPositives(_ number: Int, to positives: inout [Int]) {
    guard let currentSmallest = positives.min() else {
        positives.append(number)
        return
    }
    
    if number >= currentSmallest || positives.count < 3 {
        positives.append(number)

        if positives.count > 3 {
            let targetIndex = positives.firstIndex(of: currentSmallest)!
            positives.remove(at: targetIndex)
        }
    }
}

func addNegatives(_ number: Int, to negatives: inout [Int]) {
    guard let currentBiggest = negatives.max() else {
        negatives.append(number)
        return
    }

    if number <= currentBiggest || negatives.count < 3 {
        negatives.append(number)

        if negatives.count > 3 {
            let targetIndex = negatives.firstIndex(of: currentBiggest)!
            negatives.remove(at: targetIndex)
        }
    }
}

func combines(of negatives: [Int], _ positives: [Int]) -> [Int] {
    let negativeCount = negatives.count
    
    guard negativeCount > 0 else {
        return []
    }
    let sortedNegatives = negatives.sorted(by: <)
    var negativeDouble: Int?
    var negativeSingle: Int?
    
    switch negativeCount {
    case 1:
        negativeDouble = nil
        negativeSingle = sortedNegatives[0]
    case 2:
        negativeDouble = sortedNegatives[0] * sortedNegatives[1]
        negativeSingle = sortedNegatives[1]
    default:
        negativeDouble = sortedNegatives[0] * sortedNegatives[1]
        negativeSingle = sortedNegatives[2]
    }
    
    var combined = [Int]()
    
    if let negativeDouble = negativeDouble {
        combined.append(contentsOf: positives.map { $0 * negativeDouble })
    }
    
    if let negativeSingle = negativeSingle {
        let sortedPositives = positives.sorted(by: <)
        
        if sortedPositives.count > 1 {
            let smallestPositiveDouble = sortedPositives[0] * sortedPositives[1]
            combined.append(smallestPositiveDouble * negativeSingle)
        }
    }
    return combined
}
```

- 무언가 굉장히 깔끔하지 못한 풀이...
- 예외 케이스들을 이렇게 처리할 수밖에 없는 걸까..?

