
/*
Runtime: 52 ms, faster than 25.22% of Swift online submissions for Longest Common Prefix.
Memory Usage: 14 MB, less than 94.18% of Swift online submissions for Longest Common Prefix.
*/
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty || strs[0] == "" { return "" }
        let first = strs[0], cnt = first.count
        
        for i in 1...cnt {
            for str in strs {
                if first.prefix(i) != str.prefix(i) { return String(first.prefix(i-1)) }
            }
        }
        return first
    }
}
