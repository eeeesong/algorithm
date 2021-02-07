//10828. 스택
//https://www.acmicpc.net/problem/10828

var myStack = Stack()

for _ in 1...Int(readLine()!)! {
    let c = readLine()!.split(separator: " ")
    
    switch c[0] {
    case "push":
        myStack.push(n: Int(c[1])!)
    case "pop":
        myStack.pop()
    case "size":
        myStack.size()
    case "empty":
        myStack.empty()
    case "top":
        myStack.top()
    default:
        print("Unknown Command")
    }
}

//1️⃣ 32ms
class Stack {
    var stack = [Int]()
    
    func push(n: Int) {
        stack.append(n)
    }
    
    func pop() {
        guard !stack.isEmpty else {
            print(-1)
            return
        }
        print(stack.last!)
        stack.removeLast()
    }
    
    func size() {
        print(stack.count)
    }
    
    func empty() {
        stack.isEmpty ? print(1) : print(0)
    }
    
    func top() {
        stack.isEmpty ? print(-1) : print(stack.last!)
    }
}

//2️⃣ 24ms - isEmpty대신 count를 세고, guard를 쓰지 않았더니 각각 4ms씩 줄어들었음
class Stack {
    var stack = [Int]()
    var count = 0
    
    func push(n: Int) {
        stack.append(n)
        count += 1
    }
    
    func pop() {
        if count == 0 {
            print(-1)
        } else {
            print(stack.last!)
            stack.removeLast()
            count -= 1
        }
    }
    
    func size() {
        print(count)
    }
    
    func empty() {
        count == 0 ? print(1) : print(0)
    }
    
    func top() {
        count == 0 ? print(-1) : print(stack.last!)
    }
}
