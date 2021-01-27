//✏️Time Conversion
//https://www.hackerrank.com/challenges/time-conversion/problem

func timeConversion(s: String) -> String {
    let isAM = s.suffix(2) == "AM" ? true : false
    var time = s.dropLast(2).map{ String($0) }
    
    if isAM {
        if s.prefix(2) == "12" {
            time[0] = "0"
            time[1] = "0"
        }
    } else {
        if s.prefix(2) != "12" {
            let t = Int(time[0])!*10 + Int(time[1])! + 12
            time[0] = String(t/10)
            time[1] = String(t%10)
        }
    }
    return time.reduce(""){ $0 + $1 }
}
