//
//  AddBoldTag.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/03.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class AddBoldTag {
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        // calculate intervals is positions that we need to insert bold tags
        // merge above intervals into a final list that we don't have any intersect
        // add bold tags
        // TIME COMPLEXITY:
        // SPACE COMPLEXITY:

        var s = s
        var intervals = [[Int]]()

        for d in dict {
            intervals.append(contentsOf: RollingHash.find(Array(s), d))
        }

        intervals = merge(intervals)

        for (i, intervals) in intervals.enumerated() {
            let firstIndex = s.index(s.startIndex, offsetBy: intervals[0] + i * 7)
            let secondIndex = s.index(s.startIndex, offsetBy: intervals[1] + i * 7)
            s = String(s[..<firstIndex]) + "<b>" + String(s[firstIndex...secondIndex]) + "</b>" + String(s[s.index(after: secondIndex)...])
        }

        return s
    }

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // assume
        // 1. each interval is a array of two elements
        // 2. each interval is already sorted, interval[0] <= interval[1]
        // sort the intervals in increasing order of start
        // for each interval in intervals
            // try to merge the previous interval with the current one
            // if we cannot merge, then change previous value to current and move on

        var intervals = intervals
        if intervals.count <= 1 {
            return intervals
        }

        intervals.sort(by: { $0[0] < $1[0] })

        var current = intervals[0]
        var result = [[Int]]()
        for i in 1..<intervals.count {
            if canMerge(current, intervals[i]) {
                current = merge2Intervals(current, intervals[i])
            } else {
                result.append(current)
                current = intervals[i]
            }
        }
        result.append(current)
        return result
    }

    func canMerge(_ i1: [Int], _ i2:[Int]) -> Bool {
        return i1[1] >= i2[0] - 1
    }

    func merge2Intervals(_ i1: [Int], _ i2:[Int]) -> [Int] {
        return [i1[0], max(i1[1], i2[1])]
    }
}

struct RollingHash {
    private var l: Int
    private var b: Int
    private var p = 1009
    private var skipFactor = 0
    private var val = 0

    init(_ l: Int, _ b: Int) {
        self.l = l
        self.b = b
        self.skipFactor = calculateSkipFactor()
    }

    mutating func append(_ c: Character) {
        val = (val * b + Int(c.asciiValue!)) % p
    }

    mutating func skip(_ c: Character) {
        val = (val - (skipFactor * Int(c.asciiValue!) % p) + p) % p
    }

    func calculateSkipFactor() -> Int {
        guard l > 1 else {
            return 1
        }

        var ans = 1
        for _ in 1 ..< l {
            ans = (ans * b) % p
        }

        return ans
    }

    static func find(_ s: [Character], _ pattern: String) -> [[Int]] {
        let l = pattern.count
        var rh = RollingHash(pattern.count, 256)
        var toFind = 0
        for i in 0 ..< l {
            let ithIndex = pattern.index(pattern.startIndex, offsetBy: i)
            toFind = (toFind * rh.b + Int(pattern[ithIndex].asciiValue!)) % rh.p
        }

        var result = [[Int]]()
        for i in 0 ..< l {
            rh.append(s[i])
        }
        if rh.val == toFind {
            result.append([0, l - 1])
        }

        for i in l ..< s.count {
            rh.skip(s[i - l])
            rh.append(s[i])
            if rh.val == toFind && String(s[i - l + 1 ... i]) == pattern {
                result.append([i - l + 1, i])
            }
        }

        return result
    }
}
