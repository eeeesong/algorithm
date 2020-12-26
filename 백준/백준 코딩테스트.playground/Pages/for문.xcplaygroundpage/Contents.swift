
import Foundation

/*
 ✏️2739 구구단
 N을 입력받은 뒤, 구구단 N단을 출력하는 프로그램을 작성하시오. 출력 형식에 맞춰서 출력하면 된다.
 
 입력: 첫째 줄에 N이 주어진다. N은 1보다 크거나 같고, 9보다 작거나 같다.
 
 출력: 출력형식과 같게 N*1부터 N*9까지 출력한다.
 */


let input = readLine() ?? ""
let N = Int(input)!

for i in 1...9 {
    print("\(N) * \(i) = \(N*i)")
}

/*
 ✏️10950 A+B -3
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 출력: 각 테스트 케이스마다 A+B를 출력한다.
 */

let count = readLine() ?? ""

for _ in 1...Int(count)! {
    let input = readLine() ?? ""
    let AB = input.split(separator: " ").map{ Int($0)! }
    print(AB[0]+AB[1])
}


/*
 ✏️8393 합
 n이 주어졌을 때, 1부터 n까지 합을 구하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 n (1 ≤ n ≤ 10,000)이 주어진다
 
 출력: 1부터 n까지 합을 출력한다
 */

let max = readLine() ?? ""
var sum = 0

for i in 1...Int(max)! {
    sum += i
}

print(sum)


/*
 ✏️15552 빠른 A+B
 본격적으로 for문 문제를 풀기 전에 주의해야 할 점이 있다. 입출력 방식이 느리면 여러 줄을 입력받거나 출력할 때 시간초과가 날 수 있다는 점이다. 또한 입력과 출력 스트림은 별개이므로, 테스트케이스를 전부 입력받아서 저장한 뒤 전부 출력할 필요는 없다. 테스트케이스를 하나 받은 뒤 하나 출력해도 된다. https://www.acmicpc.net/problem/15552
 
 입력: 첫 줄에 테스트케이스의 개수 T가 주어진다. T는 최대 1,000,000이다. 다음 T줄에는 각각 두 정수 A와 B가 주어진다. A와 B는 1 이상, 1,000 이하이다.
 
 출력: 각 테스트케이스마다 A+B를 한 줄에 하나씩 순서대로 출력한다.
 */


//시간 초과가 뜨는 풀이 -> fread를 활용하라던데...
let count = readLine() ?? ""

for _ in 1...Int(count)! {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    print(input[0]+input[1])
}

/*
 ✏️2741 N 찍기
 자연수 N이 주어졌을 때, 1부터 N까지 한 줄에 하나씩 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 100,000보다 작거나 같은 자연수 N이 주어진다.
 
 출력: 첫째 줄부터 N번째 줄 까지 차례대로 출력한다.
 */

let N = Int(readLine()!)!

for i in 1...N {
    print(i)
}


/*
 ✏️2742 기찍 N
 자연수 N이 주어졌을 때, N부터 1까지 한 줄에 하나씩 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 100,000보다 작거나 같은 자연수 N이 주어진다.
 
 출력: 첫째 줄부터 N번째 줄 까지 차례대로 출력한다.
 */

let N = Int(readLine()!)!

for i in 0...N-1 {
    print(N-i)
}

/*
 ✏️11021 A+B -7
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 출력: 각 테스트 케이스마다 "Case #x: "를 출력한 다음, A+B를 출력한다. 테스트 케이스 번호는 1부터 시작한다.
 */

let T = Int(readLine()!)!

for c in 1...T {
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    print("Case #\(c): \(arr[0]+arr[1])")
}

/*
 ✏️11022 A+B -8
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 출력: 각 테스트 케이스마다 "Case #x: A + B = C" 형식으로 출력한다. x는 테스트 케이스 번호이고 1부터 시작하며, C는 A+B이다.
 */

let T = Int(readLine()!)!

for c in 1...T {
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    print("Case #\(c): \(arr[0]) + \(arr[1]) = \(arr[0]+arr[1])")
}

/*
 ✏️2438 별 찍기 -1
 첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제
 
 입력: 첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.
 
 출력: 첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.
 */

let N = Int(readLine()!)!

for i in 1...N {
    var starArr = [""]
    starArr.append(contentsOf: repeatElement("*", count: i))
    print(starArr.reduce(""){ $0 + $1 })
}

/*
 ✏️2439 별 찍기 -2
 첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제. 하지만, 오른쪽을 기준으로 정렬한 별(예제 참고)을 출력하시오.
 
 입력: 첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.
 
 출력: 첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.
 */

let N = Int(readLine()!)!

for i in 1...N {
    var starArr = [""]
    starArr.append(contentsOf: repeatElement(" ", count: N-i))
    starArr.append(contentsOf: repeatElement("*", count: i))
    print(starArr.reduce(""){ $0 + $1 })
}

/*
 ✏️10871 X보다 작은 수
 정수 N개로 이루어진 수열 A와 정수 X가 주어진다. 이때, A에서 X보다 작은 수를 모두 출력하는 프로그램을 작성하시오.
 
 입력: 첫째 줄에 N과 X가 주어진다. (1 ≤ N, X ≤ 10,000) 둘째 줄에 수열 A를 이루는 정수 N개가 주어진다. 주어지는 정수는 모두 1보다 크거나 같고, 10,000보다 작거나 같은 정수이다.
 
 출력: X보다 작은 수를 입력받은 순서대로 공백으로 구분해 출력한다. X보다 작은 수는 적어도 하나 존재한다.
 */

let X = readLine()!.split(separator: " ").map{ Int($0)! }[1]
let array = readLine()!.split(separator: " ").map{ Int($0)! }.filter{ $0 < X }
var result = ""

for i in 0...array.count-1 {
    result += "\(array[i]) "
}

print(result)

