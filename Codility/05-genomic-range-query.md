# Genomic Range Query

[Prefix sums > Genoimic Range Query](https://app.codility.com/programmers/lessons/5-prefix_sums/genomic_range_query/)



## 문제

A DNA sequence can be represented as a string consisting of the letters `A`, `C`, `G` and `T`, which correspond to the types of successive nucleotides in the sequence. Each nucleotide has an *impact factor*, which is an integer. Nucleotides of types `A`, `C`, `G` and `T` have impact factors of 1, 2, 3 and 4, respectively. You are going to answer several queries of the form: What is the minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?

The DNA sequence is given as a non-empty string S = `S[0]S[1]...S[N-1]`consisting of N characters. There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers. The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence between positions P[K] and Q[K] (inclusive).

For example, consider string S = `CAGCCTA` and arrays P, Q such that:

```
    P[0] = 2    Q[0] = 4    P[1] = 5    Q[1] = 5    P[2] = 0    Q[2] = 6
```

The answers to these M = 3 queries are as follows:

> - The part of the DNA between positions 2 and 4 contains nucleotides `G` and `C` (twice), whose impact factors are 3 and 2 respectively, so the answer is 2.
> - The part between positions 5 and 5 contains a single nucleotide `T`, whose impact factor is 4, so the answer is 4.
> - The part between positions 0 and 6 (the whole string) contains all nucleotides, in particular nucleotide `A` whose impact factor is 1, so the answer is 1.

Write a function:

> ```
> public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
> ```

that, given a non-empty string S consisting of N characters and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M integers specifying the consecutive answers to all queries.

Result array should be returned as an array of integers.

For example, given the string S = `CAGCCTA` and arrays P, Q such that:

```
    P[0] = 2    Q[0] = 4    P[1] = 5    Q[1] = 5    P[2] = 0    Q[2] = 6
```

the function should return the values [2, 4, 1], as explained above.

Write an ***\*efficient\**** algorithm for the following assumptions:

> - N is an integer within the range [1..100,000];
> - M is an integer within the range [1..50,000];
> - each element of arrays P, Q is an integer within the range [0..N − 1];
> - P[K] ≤ Q[K], where 0 ≤ K < M;
> - string S consists only of upper-case English letters `A, C, G, T`.





## 풀이 

- P[i]와 Q[i] 사이의 값 중 가장 작은 값을  찾으면 됨



### First Try

```swift
public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    let values = S.map { dna -> Int in
        switch dna {
        case "A": return 1
        case "C": return 2
        case "G": return 3
        default: return 4
        }
    }
    let queryCount = P.count
    var result = Array(repeating: 0, count: queryCount)
    
    for i in 0..<queryCount {
        let lowIndex = P[i]
        let highIndex = Q[i]
        
        if lowIndex == highIndex {
            result[i] = values[lowIndex]
        } else {
            let targetRange = values[lowIndex...highIndex]
            let lowest = Set(targetRange).min()!
            result[i] = lowest
        }
    }
    return result
}
```

- 시간복잡도 O(N*M)으로 장렬하게 시간 초과



### Second Try

- 해결이 안 돼서 검색해봄
- 각 인덱스에 도달했을 때 누적되어 있는 DNA의 개수를 비교하면 범위 안에 그 DNA가 포함되어 있는 지 판단할 수 있다 -> 이래서 부분합 레슨에 있는 거구나...

```swift
public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    let dnaCount = S.count
    var ACounts = Array(repeating: 0, count: dnaCount + 1)
    var CCounts = Array(repeating: 0, count: dnaCount + 1)
    var GCounts = Array(repeating: 0, count: dnaCount + 1)
    
    S.enumerated().forEach { i, dna in
        ACounts[i+1] = ACounts[i]
        CCounts[i+1] = CCounts[i]
        GCounts[i+1] = GCounts[i]
        
        switch dna {
        case "A": ACounts[i+1] += 1
        case "C": CCounts[i+1] += 1
        case "G": GCounts[i+1] += 1
        default: break
        }
    }
    
    let queryCount = P.count
    var result = Array(repeating: 0, count: queryCount)
    
    for i in 0..<queryCount {
        let lowIndex = P[i]
        let highIndex = Q[i] + 1
        
        if ACounts[highIndex] - ACounts[lowIndex] != 0 {
            result[i] = 1
        } else if CCounts[highIndex] - CCounts[lowIndex] != 0 {
            result[i] = 2
        } else if GCounts[highIndex] - GCounts[lowIndex] != 0 {
            result[i] = 3
        } else {
            result[i] = 4
        }
    }
    return result
}
```

- O(N+M)으로 통과!