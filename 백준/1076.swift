//✏️1076 저항
// https://www.acmicpc.net/problem/1076
import Foundation

let first = readLine()!, second = readLine()!, third = readLine()!
let numToPow = Float(colorToNum(third))

let result = (colorToNum(first)*10 + colorToNum(second)) * Int(pow(10, numToPow))
print(result)

func colorToNum(_ color: String) -> Int {
   switch color {
   case "black":
       return 0
   case "brown":
       return 1
   case "red":
       return 2
   case "orange":
       return 3
   case "yellow":
       return 4
   case "green":
       return 5
   case "blue":
       return 6
   case "violet":
       return 7
   case "grey":
       return 8
   case "white":
       return 9
   default:
       return -1
   }
}
