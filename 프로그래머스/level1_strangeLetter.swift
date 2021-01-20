//프로그래머스 - 이상한 문자 만들기
func solution(_ s:String) -> String {

    var answer = ""
    var wordIdx = 0

    for crt in s {
        if crt.isLetter {
            answer += wordIdx%2 == 0 ? String(crt).uppercased() : String(crt).lowercased()
            wordIdx += 1
        } else {
            answer += String(crt)
            wordIdx = 0
        }
    }
    return answer
}
