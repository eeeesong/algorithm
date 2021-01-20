//프로그래머스 - 크레인 인형뽑기
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    var board = board
    var basket = moves.map{ (move) -> Int in
        for i in 0..<board.count {
            let idx = move-1
            if board[i][idx] != 0 {
                let doll = board[i][idx]
                board[i][idx] = 0
                return doll
            }
        }
        return 0
    }
    
    func calcScore(total: Int) -> Int {
        basket = basket.filter{ $0 != 0 }
        guard basket.count > 1 else { return total }
        
        var score = total
        for i in 1..<basket.count {
            if basket[i-1] == basket[i], basket[i-1] != 0{
                basket[i] = 0
                basket[i-1] = 0
                score += 2
            }
        }
        return score == total ? total : calcScore(total: score)
    }
    return calcScore(total: -1) + 1
}
