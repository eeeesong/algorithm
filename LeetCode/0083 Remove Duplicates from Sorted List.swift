
/*
Runtime: 28 ms, faster than 46.75% of Swift online submissions for Remove Duplicates from Sorted List.
Memory Usage: 13.8 MB, less than 75.74% of Swift online submissions for Remove Duplicates from Sorted List.
*/
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var prev: ListNode? = nil //nil로 시작
        var current = head
        var next = head?.next
        
        let minVal = head?.val
        var headNow = head
        
        while current != nil {
            if current?.val == next?.val {
                if current?.val == minVal { headNow = next }
                prev?.next = next
            } else { //중복값을 삭제하지 않았을 때만 prev를 업데이트 -> 안그러면 연속 중복 시 띄엄띄엄 삭제됨
                prev = current
            }
            current = next
            next = next?.next
        }
        return headNow
    }
}
