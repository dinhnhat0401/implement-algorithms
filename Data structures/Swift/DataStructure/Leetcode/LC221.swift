//
//  LC221.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC221 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        // Dynamic programming
        // use a DP grid
        // dp[i][j] is the size of the maximum square whose bottom right conner is the cell with index [i, j]
        // if matrix[i][j] == 0
            // dp[i][j] = 0
        // else
            // dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
        if matrix.count == 0 {
            return 0
        }

        let M = matrix.count
        let N = matrix[0].count
        // to avoid the out of bound issue when substracting indexes by 1,
        // assume that dp[0][c] = 0 and dp[r][0] = 0
        // start caluclate from dp[1][c], dp[r][1]
        // also notice that dp has (M + 1, N + 1) size
        var dp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: M + 1)

        var maxSize = 0
        for r in 1 ... M {
            for c in 1 ... N {
                if matrix[r - 1][c - 1] == "0" {
                    continue
                }

                dp[r][c] = min(dp[r - 1][c], dp[r - 1][c - 1], dp[r][c - 1]) + 1
                maxSize = max(maxSize, dp[r][c])
            }
        }

        return maxSize * maxSize
    }
}
