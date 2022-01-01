# Baekjoon

## [1로 만들기](https://www.acmicpc.net/problem/1463)

* 분류: 다이나믹 프로그래밍
* 풀이 언어: Swift
* 문제 요약: 정수 N을 연산 세 개를 적절히 사용해서 1로 만들 때, 연산 횟수의 최솟값 구하기

### 코드

##### 동적계획법 이용 풀이 (Dynamic Programming)

```swift
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

for i in 2..<n + 1 {
    dp[i] = dp[i - 1] + 1
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i / 3] + 1)
    }
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i / 2] + 1)
    }
}

print(n == 1 ? 0 : dp[n])
```

* 메모리: 70044 KB
* 시간: 44 ms

##### 재귀 함수 이용

```swift
func f(_ n: Int) -> Int {
    return n < 2 ? 0 : min(f(n / 2) + n % 2, f(n / 3) + n % 3) + 1
}

print(f(Int(readLine()!)!))
```

* 메모리: 62224 KB
* 시간: 8 ms

### 회고

* DP로 풀기 비교적 어렵지 않았던 문제. 문제에서 제시하는 세 가지 연산을 점화식으로 작성 후 Bottom-up(상향식)으로 구현했다.
* 하지만 이 문제의 분류가 다이나믹 프로그래밍임에도 시간, 공간복잡도면에서 월등한 다른 풀이가 존재한다. 위의 '재귀 함수 이용' 풀이가 그것인데... 음 어떻게 해서 이런 풀이가 나오는지 잘 이해가 가지 않는다🥲 스터디원분들께 한번 도움을 구해봐야겠다.