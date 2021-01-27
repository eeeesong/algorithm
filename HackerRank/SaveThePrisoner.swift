//✏️Save The Prisoner
//https://www.hackerrank.com/challenges/save-the-prisoner/problem

func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    return ((m-1) % n + s - 1 ) % n + 1
}
