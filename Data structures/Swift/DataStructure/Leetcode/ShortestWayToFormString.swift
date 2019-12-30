//
//  ShortestWayToFormString.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/30.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class ShortestWay {
    let a = Int(Character("a").asciiValue!)
    let z = Int(Character("z").asciiValue!)

    func shortestWay(_ source: String, _ target: String) -> Int {
        // check if their
        var process = [[Int]](repeating: [Int](), count: z - a + 1)
        let t = Array(source)
        for (i, c) in t.enumerated() {
            process[Int(c.asciiValue!) - a].append(i)
        }
        if !isExistWay(target, process) {
            return -1
        }

        // initialize a DP array
        // calculate minimum number of subsequences for each substrings
        // if dp[i][i + l] is a subsequence => dp[i][i + l] = 1
        // else
        // dp[i][i + l] = min(dp[i+1][i + k] + dp[i + k + 1][i + l])
        // return dp[0][n-1] with n is target.count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: target.count + 1), count: target.count + 1)
        for i in 0 ..< dp.count - 1 {
            dp[i][i] = 1
        }

        let n = target.count
        if n == 1 {
            return 1
        }

        for l in 1 ..< n {
            for i in 0 ..< n-l {
                let startIndex = target.startIndex
                let ith = target.index(startIndex, offsetBy: i)
                let lth = target.index(ith, offsetBy: l)
                if isSubsequence(String(target[ith ... lth]), process) {
                    dp[i][i + l] = 1
                    continue
                }
                var tmp = Int.max
                for k in 0 ..< l {
                    tmp = min(tmp, dp[i][i + k] + dp[i + k + 1][i + l])
                }
                dp[i][i + l] = tmp
            }
        }

        return dp[0][n-1]
    }

    func isExistWay(_ s: String, _ process: [[Int]]) -> Bool {
        let s = Array(s)
        for c in s {
            if process[Int(c.asciiValue!) - a].count == 0 {
                return false
            }
        }

        return true
    }

    func isSubsequence(_ s: String, _ process: [[Int]]) -> Bool {
        // preprocessing t fill in indexes of each character in t to a array process
        // sample:
        // s = "abcd"
        // t = "abadec"
        // after processing: process = [[0, 2], [1], [5], [3], [4]]
        // prev = -1
        // for each character c in s
            // find upper bound index which > prev and belong to process[c - 'a']
        // this case will return false because
        // prev = -1
        // -> c = 'a', prev = 0
        // -> c = 'b', prev = 1
        // -> c = 'c', prev = 5
        // -> c = 'd', prev = -1, because prev['d' - 'a'] doesn't contain any element which is greater than or equal (prev + 1)

        let s = Array(s)
        var prev = -1
        for c in s {
            prev = findUpperbound(process[Int(c.asciiValue!) - a], prev + 1)
            if prev == -1 {
                return false
            }
        }

        return true
    }

    func findUpperbound(_ arr: [Int], _ val: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        var ans = -1

        while r >= l {
            let mid = l + (r - l)/2
            if arr[mid] == val {
                return arr[mid]
            }

            if arr[mid] > val {
                ans = arr[mid]
                // go left to find better value
                r = mid - 1
            } else {
                // go right to find a value
                l = mid + 1
            }
        }

        return ans
    }
}

