//
//  MinDistance.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

class MinDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        // DP formula
        // dp[i][j] stand for min distance between word1[0, i] and word2[0, j]
        // dp[i][j] = min(dp[i][j - 1], dp[i - 1][j - 1], dp[i - 1][j]) + 1   if word1[i] != word2[j]
                 // = dp[i - 1][j - 1]                                        if word1[i] == word2[j]
        // if i == 0 => just need to check if word1[i] is belong to word2[0, j]
        // same with j = 0
        // base on above simular to calculate dp[m - 1][n - 1] with m = word1.count, n = word2.count
        // TIME COMPLEXITY: O(mn)
        // SPACE COMPLEXITY: O(mn)
        let m = word1.count
        let n = word2.count
        let word1 = Array(word1)
        let word2 = Array(word2)
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        for i in 0 ..< n {
            dp[0][i] = word2[...i].contains(word1[0]) ? i : i + 1
        }

        for j in 0 ..< m {
            dp[j][0] = word1[...j].contains(word2[0]) ? j : j + 1
        }

        for i in 1 ..< m {
            for j in 1 ..< n {
                if word1[i] == word2[j] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j - 1]), dp[i - 1][j]) + 1
                }
            }
        }

        return dp[m-1][n - 1]
    }
}
