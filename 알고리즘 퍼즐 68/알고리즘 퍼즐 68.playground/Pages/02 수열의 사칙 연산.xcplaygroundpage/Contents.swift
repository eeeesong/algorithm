/*
 ✏️문제
 여기서는 나열된 각 숫자 사이에 사칙연산의 연산자를 넣어 계산해보기로 합니다.
 (모든 숫자 사이에 연산자를 넣지는 않아도 되지만, 전체에서 최소한 하나는 넣어야 함)
 
 완성된 식을 계산한 결과 '원래 수를 거꾸로 나열한 숫자'가 되는 것을 생각해 보겠습니다.
 계산 순서는 수학에서 통용되는 순서를 따릅니다.
 
 예)     351 -> 3 x 51 = 153
        621 -> 6 x 21 = 126
        886 -> 8 x 86 = 688
 
 1,000 ~ 9,999 중 위의 조건을 만족하는 수를 구해 보세요.
 */


/*
 - 계산 후에도 4자리수여야 하므로 곱셈 외의 연산 기호가 사용될 수 없다
 - 최소 한번은 연산되어야 한다
 String으로 계산식 만든 뒤, NSExpression 통해 값 가져오기
 https:nshipster.com/nsexpression/
 */

import Foundation

func getCalc(for n: Int) -> Bool {

    var numberInString = String(n)
    let reversedNumberInString = String(numberInString.reversed())

    let operation = ["*",""]
    let last = operation.count-1
    let numberInArray = numberInString.map{ String($0) }

    for a in 0...last {
        for b in 0...last {
            for c in 0...last {
                let calculation =
                    numberInArray[0] + operation[a] +
                    numberInArray[1] + operation[b] +
                    numberInArray[2] + operation[c] + numberInArray[3]
                
                if calculation.count != 4 {
                    let calcNumber = NSExpression(format: calculation)
                    let newNumber = calcNumber.expressionValue(with: nil, context: nil) as? Int
                    numberInString = String(newNumber!)
                    
                    if numberInString == reversedNumberInString {
                        print("\(n) -> \(calculation) = \(numberInString)")
                        return true
                    }
                }
            }
        }
    }
    return false
}

var number = 1000
var result: [Int] = []

while number < 10000 {
    if getCalc(for: number) { result.append(number) }
    number += 1
}

print(result)

// 5931 -> 5*9*31 = 1395
// [5931]
