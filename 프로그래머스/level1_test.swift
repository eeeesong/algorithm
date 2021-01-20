//프로그래머스 - 모의고사
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let soopoja1 = [1,2,3,4,5]
    let soopoja2 = [2,1,2,3,2,4,2,5]
    let soopoja3 = [3,3,1,1,2,2,4,4,5,5]
 
    func checkAnswer(from pattern: [Int]) -> Int {
        var score = 0
        let cnt = pattern.count
        for i in 0..<answers.count {
            score += answers[i] == pattern[i%cnt] ? 1 : 0
        }
        return score
    }
    
    let scores = [1: checkAnswer(from: soopoja1),
                  2: checkAnswer(from: soopoja2),
                  3: checkAnswer(from: soopoja3)]
    let max = scores.values.max()
    var top = [Int]()
    scores.forEach { (key, value) in if value == max { top.append(key) } }
    
    return top.sorted()
}
