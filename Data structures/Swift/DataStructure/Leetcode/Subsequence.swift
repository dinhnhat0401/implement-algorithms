//
//  Subsequence.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/26.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class Subsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
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
        let a = Int(Character("a").asciiValue!)
        let z = Int(Character("z").asciiValue!)
        var process = [[Int]](repeating: [Int](), count: z - a)
        let t = Array(t)
        for (i, c) in t.enumerated() {
            process[Int(c.asciiValue!) - a].append(i)
        }

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
