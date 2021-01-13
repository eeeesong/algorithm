/*
Runtime: 48 ms, faster than 91.52% of Swift online submissions for Linked List Cycle.
Memory Usage: 15.4 MB, less than 62.19% of Swift online submissions for Linked List Cycle.
*/

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var slow = head
        var fast = head?.next
        
        while true {
            if fast == nil { return false }
            if slow === fast { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }
    }
}
