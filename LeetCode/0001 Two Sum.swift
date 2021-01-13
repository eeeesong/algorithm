
class Solution {
    //1. 중첩 루프 활용
    /*
    Runtime: 124 ms, faster than 11.26% of Swift online submissions for Two Sum.
    Memory Usage: 14.3 MB, less than 28.33% of Swift online submissions for Two Sum.
    */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var arr = nums
        let cnt = arr.count
        
        for i in 1...cnt {
            let first = arr[cnt-i]
            
            for j in 0..<cnt-i {
                let second = arr[j]
                
                if first + second == target {
                    return [cnt-i, j]
                }
            }
        }
        return []
    }
    //2. 딕셔너리와 보수 활용
    /*
    Runtime: 36 ms, faster than 75.77% of Swift online submissions for Two Sum.
    Memory Usage: 14 MB, less than 64.32% of Swift online submissions for Two Sum.
    */
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {

            var dics = [Int:Int]()
            
            for i in 0..<nums.count {
                dics[nums[i]] = i
            }
            
            for j in 0..<nums.count {
                let complement = target - nums[j] //보수 구하기
                let cIdx = dics[complement] //보수에 해당하는 nums의 인덱스값 가져오기
                if cIdx != nil && cIdx != j { return [cIdx!, j]}
            }
            return []
        }
}
