// BOJ 1463 1로 만들기
// https://www.acmicpc.net/problem/1463
// 22.03.31

var N = Int(readLine()!)!
var result = Int.max

func divideBy3(x: Int) -> Int? {
    if x % 3 == 0 {
        return x/3
    } else {
        return nil
    }
}

func divideBy2(x: Int) -> Int? {
    if x % 2 == 0 {
        return x/2
    } else {
        return nil
    }
}

func minus1(x: Int) -> Int? {
    if x - 1 > 0 {
        return x - 1
    } else {
        return nil
    }
}

func dfs(x: Int, count: Int) {
    guard x != 1 else {
        result = min(result, count)
        return
    }
    
    guard count < result else {
        return
    }
    
    if let next = divideBy3(x: x) {
        dfs(x: next, count: count + 1)
    }
    
    if let next = divideBy2(x: x) {
        dfs(x: next, count: count + 1)
    }
    
    if let next = minus1(x: x) {
        dfs(x: next, count: count + 1)
    }

}

dfs(x: N, count: 0)

print(result)

