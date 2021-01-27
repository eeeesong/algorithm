//✏️Number Line Jumps
//https://www.hackerrank.com/challenges/kangaroo/problem

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    guard !(x1 > x2 && v1 > v2) && !(x1 < x2 && v1 < v2) && !(x1 == x2 && v1 != v2) && !(x1 != x2 && v1 == v2) else {
        return "NO"
    }
    if x1 == x2 && v1 == v2 { return "YES" }
    
    var fronter = x1, fronterSpeed = v1
    var backer = x2, backerSpeed = v2
    
    if x1 < x2 {
        fronter = x2
        fronterSpeed = v2
        backer = x1
        backerSpeed = v1
    }

    let value = (fronter - backer)/(backerSpeed - fronterSpeed)
    let extra = (fronter - backer)%(backerSpeed - fronterSpeed) == 0 ? 0 : 1
    let calcF = fronter + fronterSpeed*(value+extra)
    let calcB = backer + backerSpeed*(value+extra)

    return calcF == calcB ? "YES" : "NO"
}
