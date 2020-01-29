//
//  MinDifficulty.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/28.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class MinDifficulty {
    var memo: [[Int]]!
    // TLE
    func minDifficulty(_ jd: [Int], _ d: Int) -> Int {
        memo = [[Int]](repeating: [Int](repeating: -2, count: d + 1), count: jd.count)
        // result = min(max([0...j] + minDifficulty(jobDifficulty, d - 1))) with j in range [0 ... N - (d - 1)]
        return dfs(jd, d, 0)
    }

    func dfs(_ jd: [Int], _ d: Int, _ c: Int) -> Int {
        let N = jd.count

        if d == 1 {
            return jd[c...].max()!
        }

        if N < d || d < 0 {
            return -1
        }

        if memo[c][d] != -2 {
            return memo[c][d]
        }

        var result = Int.max
        var maxd = 0
        for i in c ..< N - 1 {
            let nextMin = dfs(jd, d - 1, i + 1)
            maxd = max(maxd, jd[i])
            if nextMin != -1 {
                result = min(result, maxd + nextMin)
            }
        }

        memo[c][d] = result != Int.max ? result : -1
        return memo[c][d]
    }

    func minDifficulty1(_ jd: [Int], _ d: Int) -> Int {
        let N = jd.count
        if d == 1 {
            return jd.max()!
        }

        if N < d || d < 0 {
            return -1
        }

        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: d + 1), count: N)
        for i in 0 ..< N {
            dp[i][0] = 0
            dp[i][1] = jd[i...].max()!
        }

        for k in 2 ... d {
            for i in 0 ..< N - k + 1 {
                var maxd = 0
                for j in i ..< N - 1 {
                    if dp[j + 1][k - 1] != Int.max {
                        maxd = max(maxd, jd[j])
                        dp[i][k] = min(dp[i][k], maxd + dp[j + 1][k - 1])
                    }
                }
            }
        }

        return dp[0][d]
    }
}
