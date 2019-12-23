//
//  GuessNumberII.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/23.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class GuessNumberII {
    func getMoneyAmount(_ n: Int) -> Int {
        if n == 1 {
            return 0
        }

        if n == 2 {
            return 1
        }

        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: n + 1), count: n + 1)
        for i in 1 ... (n - 1) {
            dp[i][i] = 0
            dp[i][i + 1] = i
        }
        dp[n][n] = 0

        for l in 1 ... (n - 2) {
            for r in (l + 2) ... n {
                for i in (l + (r - l)/2) ... r {
                    let pivot = i + (r - i) / 2
                    dp[l][r] = min(dp[l][r], pivot + max(dp[l][pivot - 1], dp[min(pivot + 1, r)][r]))
                }
            }
        }

        return dp[1][n]
    }
}

