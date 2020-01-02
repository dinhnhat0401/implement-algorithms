//
//  KnightProbability.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

// https://leetcode.com/problems/knight-probability-in-chessboard/
// TLE
class KnightProbability {
    func knightProbability(_ N: Int, _ K: Int, _ r: Int, _ c: Int) -> Double {
        // result = 0
        // backtracking with current position, current posibility, current move, result
            // if current move is K + 1
                // if current position is on the board
                    // add to the result
                    // return
            // for each direction (posibility of the knight goes to that direction is 1/8)
                // if K is remain on the chessboard
                    // calculate that posibility and add to result
                    // need to store posibility of Knight move to previous position => can have it by store posibility in an [N][N] array
                // calculate posibility from this position
                // back-track

        var result: Double = 0
        bt(N, K, r, c, 1.0, 0, &result)
        return result
    }

    func bt(_ N: Int, _ K: Int, _ r: Int, _ c: Int, _ posibility: Double, _ move: Int, _ result: inout Double) {
        if move == K {
            result += posibility
            return
        }

        for d in directions {
            let newPos = [r + d[0], c + d[1]]
            if newPos[0] >= 0 && newPos[0] < N && newPos[1] >= 0 && newPos[1] < N {
                bt(N, K, newPos[0], newPos[1], posibility * 0.125, move + 1, &result)
            }
        }
    }

    func knightProbability2(_ N: Int, _ K: Int, _ r: Int, _ c: Int) -> Double {
        // dp[i][j][k] stands for posibility of the knight at position [i][j] still in the chessboard after k moves
        // dp[i][j][0] = 1 if i and j belong to [0, N)
        // dp[i][j][k] = sum(dp[i + d[0]][j + d[1]][k - 1]) // if i + d[0] and j + d[1] is belong to [0, N)
        var dp = [[[Double]]](repeating: [[Double]](repeating: [Double](repeating: 0, count: K + 1), count: N), count: N) // dp[N][N][K]
        for i in 0 ..< N {
            for j in 0 ..< N {
                dp[i][j][0] = 1.0
            }
        }

        for k in 1 ... K {
            for i in 0 ..< N {
                for j in 0 ..< N {
                    var sum: Double = 0
                    for d in directions {
                        let newPos = [i + d[0], j + d[1]]
                        if newPos[0] >= 0 && newPos[0] < N && newPos[1] >= 0 && newPos[1] < N {
                            sum += (dp[newPos[0]][newPos[1]][k - 1] * 0.125)
                        }
                    }
                    dp[i][j][k] = sum
                }
            }
        }

        return dp[r][c][K]
    }

    let directions = [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2]]
}
