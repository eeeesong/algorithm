/*
Runtime: 8 ms, faster than 57.75% of Swift online submissions for Reverse Integer.
Memory Usage: 13.9 MB, less than 57.61% of Swift online submissions for Reverse Integer.
*/
class Solution {
    func reverse(_ x: Int) -> Int {
        let isMinus = x >= 0 ? false : true //부호 저장
        let xInReversedStr = String(String(abs(x)).reversed())
        if let reversedInt = Int32(xInReversedStr) {
            return isMinus ? Int(-reversedInt) : Int(reversedInt)
        } else {
            return 0
        }
    }
}
