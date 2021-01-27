//✏️Diagonal Difference
//https://www.hackerrank.com/challenges/diagonal-difference/problem

func diagonalDifference(arr: [[Int]]) -> Int {
    let cnt = arr[0].count
    var first = 0, second = 0
    
    for i in 0..<cnt {
        first += arr[i][i]
        second += arr[i][cnt-i-1]
    }
    return abs(first-second)
}
