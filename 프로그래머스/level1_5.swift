//핸드폰 번호 가리기
//https://programmers.co.kr/learn/courses/30/lessons/12948

func solution(_ phone_number:String) -> String {
    let lastFour = phone_number.suffix(4)
    return String(repeating: "*", count: phone_number.count-4) + lastFour
}

//3달쯤 전의 풀다 만 흔적이 남아 있었다.
//이걸 이렇게 어렵게 생각했다니... 어쨌든 발전하고 있구나!

/*
func solution(_ phone_number:String) -> String {
    var numArr:[String] = []
    
    for c in phone_number {
        numArr.append(String(c))
    }
    
    for i in 0..<numArr.count-4 {
        numArr[i] = "*"
    }
    
    var result:String = ""
    
    for v in numArr {
        result += v
    }
    
    return result
}
*/
