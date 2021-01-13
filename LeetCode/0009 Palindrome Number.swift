/*
Runtime: 44 ms, faster than 68.53% of Swift online submissions for Palindrome Number.
Memory Usage: 13.9 MB, less than 93.35% of Swift online submissions for Palindrome Number.
*/
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let str = String(x)
        let rStr = String(str.reversed())
        return str == rStr ? true : false
    }
}
