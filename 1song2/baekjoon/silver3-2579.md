# Baekjoon

## [계단 오르기](https://www.acmicpc.net/problem/2579)

* 분류: 다이나믹 프로그래밍
* 풀이 언어: Swift
* 문제 요약: 특정한 규칙이 존재하는 계단 오르기 게임에서 얻을 수 있는 총 점수의 최댓값 구하기

### 코드

```swift
let n = Int(readLine()!)!
var scores = [Int](repeating: 0, count: n)
var dp = [Int](repeating: -1, count: n)

for i in 0..<n {
    scores[i] = Int(readLine()!)!
}

if n >= 1 {
    dp[0] = scores[0]
}
if n >= 2 {
    dp[1] = max(scores[0] + scores[1], scores[1])
}
if n >= 3 {
    dp[2] = max(scores[0] + scores[2], scores[1] + scores[2])
}
if n > 3 {
    for i in 3..<n {
        dp[i] = max(dp[i - 2] + scores[i], dp[i - 3] + scores[i - 1] + scores[i])
    }
}

print(dp[n - 1])
```

* 메모리: 62228 KB
* 시간: 8 ms

### 회고

* [BOJ 거리](https://github.com/iOS-study-delicato/Algorithm-Study/blob/master/1song2/baekjoon/silver1-12026.md)와 비슷하게 `next` 변수를 두고 풀면 되지 않을까 생각하고 시도했지만... 아니었다😞
* 어떤 한 계단(`출발점`)에서 오를 수 있는 경우의 수(`도착점들`) 보다, 그 계단(`도착점`)에 오르기까지 거치는 경우의 수(`출발점들`)를 생각하는 것이 이 문제에선 훨씬 간편하다. `출발점` → `도착점들`은 연속해서 밟는 것을 처리하기가 까다로운데, `도착점` → `출발점들`은 만약 도착점의 직전 계단(`n - 1`)을 밟는다면 그 직전 계단 전에 밟아야 하는 계단은 직전 계단의 전전 계단(`n - 3`)이 되어야 한다는 것을 식으로 표현할 수 있기 때문이다.