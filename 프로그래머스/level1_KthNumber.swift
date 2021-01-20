//프로그래머스 - K번째 수
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    commands.forEach { (command) in
        result.append(array[command[0]-1..<command[1]].sorted()[command[2]-1])
    }
    return result
}
