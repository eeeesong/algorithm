//20. Valid Parentheses
//https://leetcode.com/problems/valid-parentheses/submissions/
/*
Runtime: 0 ms, faster than 100.00% of Swift online submissions for Valid Parentheses.
Memory Usage: 14.4 MB, less than 68.67% of Swift online submissions for Valid Parentheses.
*/

func isValid(_ s: String) -> Bool {
    var stack = [Int]()
    
    func crtToInt(from crt: Character) -> Int {
        switch crt {
        case "(":
            return 1
        case ")":
            return -1
        case "[":
            return 2
        case "]":
            return -2
        case "{":
            return 3
        case "}":
            return -3
        default:
            return 0
        }
    }
    
    for crt in s {
        let n = crtToInt(from: crt)
        if let last = stack.last,
           last + n == 0,
           last > n {
            stack.removeLast()
        } else {
            stack.append(n)
        }
    }
    
    return stack.isEmpty ? true : false
}
