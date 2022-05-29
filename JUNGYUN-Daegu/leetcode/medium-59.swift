// LeetCode Medium 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii/
// 22.05.29


class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var board = Array(repeating: Array(repeating: 0, count: n), count: n)
        let moves: [(Int, Int)] = [(0, 1),(1, 0),(0, -1),(-1, 0)]
        var currentMoveIndex: Int = 0 {
            didSet {
                currentMoveIndex = currentMoveIndex % 4
            }
        }
        
        var y: Int = 0
        var x: Int = 0
        
        for i in 1...n*n {
            guard board[y][x] == 0 else { break }
            
            board[y][x] = i
            
            let nextY = y + moves[currentMoveIndex].0
            let nextX = x + moves[currentMoveIndex].1
            
            if nextY < n && nextX < n
                && nextY >= 0 && nextX >= 0
                && board[nextY][nextX] == 0 {
                
                y = nextY
                x = nextX
                continue
            } else {
                currentMoveIndex += 1
                let nextY = y + moves[currentMoveIndex].0
                let nextX = x + moves[currentMoveIndex].1
                y = nextY
                x = nextX
            }
        }
        return board
    }
}
