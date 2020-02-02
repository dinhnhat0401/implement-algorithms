//
//  KthClosest.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class KthClosest {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        if K > points.count {
            return []
        }

        var points = points
        let threshold = quickSelect(&points, K, 0, points.count - 1)
        if threshold == -1 {
            return []
        }

        var result = [[Int]]()
        for p in points {
            if p[0] * p[0] + p[1] * p[1] <= threshold {
                result.append(p)
                if result.count == K {
                    break
                }
            }
        }
        return result
    }

    func quickSelect(_ points: inout [[Int]], _ K: Int, _ l: Int, _ r: Int) -> Int {
        // use quick select approach
        // generate a random number in range 0 ..< N
        // swap points[r] and points[0]
        // try to calculate the new position newPos for points[r] in points:
            // points[i] < points[newPos] === points[r] < points[j]
            // 0 <= i < newPos < j < N
        var ll = l + 1
        var rr = r
        let random = Int.random(in: l ... r)
        let threshold = calc(points[random])
        points.swapAt(l, random)
        while true {
            while ll <= r && calc(points[ll]) < threshold {
                ll += 1
                continue
            }

            while rr > l && calc(points[rr]) >= threshold {
                rr -= 1
                continue
            }

            if ll >= rr {
                break
            }

            points.swapAt(ll, rr)
            ll += 1
            rr -= 1
        }

        points.swapAt(l, rr)

        if rr == K - 1 {
            return calc(points[rr])
        }

        if rr > K - 1 {
            return quickSelect(&points, K, l, rr - 1)
        }

        return quickSelect(&points, K, rr + 1, r)
    }

    func calc(_ p: [Int]) -> Int {
        return p[0] * p[0] + p[1] * p[1]
    }
}
