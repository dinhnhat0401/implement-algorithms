//
//  SplitArrayLargestSum.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/20.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class SplitArrayLargestSum {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        // let dp[i][j] is (minimize) largest sum of dividing sub array of i elements from 0 to i - 1 to j parts
        // dp[i][j] = min(max(dp[k][j - 1], nums[k + 1], nums[k + 2] + ... + nums[i]) with k in range [0, i))
        let n = nums.count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: m + 1), count: n + 1)
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0 ..< n {
            sub[i + 1] = sub[i] + nums[i]
        }
        dp[0][0] = 0

        for j in 1 ... m {
            for i in 1 ... n {
                for k in 0 ..< i {
                    dp[i][j] = min(dp[i][j], max(dp[k][j - 1], sub[i] - sub[k]))
                }
            }
        }

        return dp[n][m]
    }
}
