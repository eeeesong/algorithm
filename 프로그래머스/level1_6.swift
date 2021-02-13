//비밀지도
//https://programmers.co.kr/learn/courses/30/lessons/17681


func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        let map = combineTwoMaps(from: arr1[i], arr2[i], finalCount: n)
        answer.append(String(map.reversed()))
    }
    return answer
}

func combineTwoMaps(from number1: Int, _ number2: Int, finalCount: Int) -> String {
    var n1 = number1, n2 = number2
    var map = ""
    
    while n1 > 0 || n2 > 0 {
        map += n1%2 + n2%2 > 0 ? "#" : " "
        n1 /= 2
        n2 /= 2
    }
    
    if map.count < finalCount {
        map += String(repeating: " ", count: finalCount - map.count)
    }
    
    return map
}
