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

    let directions = [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, 2]]
}
