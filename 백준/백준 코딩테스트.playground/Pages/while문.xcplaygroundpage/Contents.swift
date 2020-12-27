
import Foundation

/*
✏️10952 A+B -5
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

 입력: 입력은 여러 개의 테스트 케이스로 이루어져 있다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10) 입력의 마지막에는 0 두 개가 들어온다.

 출력: 각 테스트 케이스마다 A+B를 출력한다.
*/

var arr = readLine()!.split(separator: " ").map{ Int($0)! }

while !arr.contains(0) {
    print(arr[0] + arr[1])
    arr = readLine()!.split(separator: " ").map{ Int($0)! }
}

/*₩
✏️10951 A+B -4
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

 입력: 입력은 여러 개의 테스트 케이스로 이루어져 있다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)

 출력: 각 테스트 케이스마다 A+B를 출력한다.
*/

var input = readLine() ?? ""

while input != "" {
    let arr = input.split(separator: " ").map{ Int($0)! }
    print(arr[0] + arr[1])
    input = readLine() ?? ""
}

/*
✏️1110 더하기 사이클
 0보다 크거나 같고, 99보다 작거나 같은 정수가 주어질 때 다음과 같은 연산을 할 수 있다. 먼저 주어진 수가 10보다 작다면 앞에 0을 붙여 두 자리 수로 만들고, 각 자리의 숫자를 더한다. 그 다음, 주어진 수의 가장 오른쪽 자리 수와 앞에서 구한 합의 가장 오른쪽 자리 수를 이어 붙이면 새로운 수를 만들 수 있다. 다음 예를 보자.
 26부터 시작한다. 2+6 = 8이다. 새로운 수는 68이다. 6+8 = 14이다. 새로운 수는 84이다. 8+4 = 12이다. 새로운 수는 42이다. 4+2 = 6이다. 새로운 수는 26이다.
 위의 예는 4번만에 원래 수로 돌아올 수 있다. 따라서 26의 사이클의 길이는 4이다.
 N이 주어졌을 때, N의 사이클의 길이를 구하는 프로그램을 작성하시오.

 입력: 첫째 줄에 N이 주어진다. N은 0보다 크거나 같고, 99보다 작거나 같은 정수이다.

 출력: 첫째 줄에 N의 사이클 길이를 출력한다.
*/

let input = Int(readLine()!)!
var first = input/10, second = input%10
var temp = 100, cycle = 0

while temp != input {
    temp = second*10 + (first+second)%10
    cycle += 1
    first = temp/10
    second = temp%10
}

print(cycle)

