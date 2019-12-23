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

        var dp = [[Int]](repeating: [Int](repeating: -1, count: n + 1), count: n + 1)
        for i in 1 ... (n - 1) {
            dp[i][i] = 0
            dp[i][i + 1] = i
        }
        dp[n][n] = 0

        for len in 2 ... (n - 1) {
            for l in 1 ... n - len {
                var minVal = Int.max
                for pivot in (l + len/2) ..< (l + len) {
                    minVal = min(minVal, pivot + max(dp[l][pivot - 1], dp[pivot + 1][l + len]))
                }
                dp[l][l + len] = minVal
            }
        }

        return dp[1][n]
    }
}

