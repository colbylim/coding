//문제 설명
//
//자연수 n이 주어졌을 때, n의 다음 큰 숫자는 다음과 같이 정의 합니다.
//조건 1. n의 다음 큰 숫자는 n보다 큰 자연수 입니다.
//조건 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
//조건 3. n의 다음 큰 숫자는 조건 1, 2를 만족하는 수 중 가장 작은 수 입니다.
//예를 들어서 78(1001110)의 다음 큰 숫자는 83(1010011)입니다.
//자연수 n이 매개변수로 주어질 때, n의 다음 큰 숫자를 return 하는 solution 함수를 완성해주세요.
//제한 사항
//n은 1,000,000 이하의 자연수 입니다.

import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = n + 1
    
    while n.nonzeroBitCount != answer.nonzeroBitCount {
        answer += 1
    }
    
    return answer
}

func makeNumbers(_ minValue: Int, _ maxCount: Int, _ numbers: [String], _ depth: Int, _ answer: inout Int, visited: inout [Bool]) {
    if maxCount == depth {
        let n = Int(numbers.reduce("", { $0 + $1 }), radix: 2)!
        if n == 83 {
            print()
        }
        if n <= minValue { return }
        if (n < answer) || (answer == 0) {
            answer = n
        }
        
        return
    }
    
    var t = numbers
    for i in 0 ..< maxCount {
        if i != depth {
            if visited[i] == true {
                continue
            }
            visited[i] = true
            t.swapAt(i, depth)
            makeNumbers(minValue,
                        maxCount,
                        t,
                        depth + 1,
                        &answer,
                        visited: &visited)
            visited[i] = false
        }
    }
}

print(solution(15))
//let a = 78.nonzeroBitCount
//let a1 = String(78, radix: 2)
//let a2 = Int(a1, radix: 2)


