//
//  LC1057.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/10.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LC1057 {
    func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> [Int] {
        // use bucket sort idea
        // since number of distances between bikes and workers are limited to 0 -> 2000
        // we can group worker-bike base on their distance
        // Note: we also need to group in order of woker index then bike index
        // After that we can just go through the distances from near to far order and picking worker to assign bike
        let W = workers.count
        _ = bikes.count
        let D = 2000
        var bucket = [[[Int]]](repeating: [[Int]](), count: D)
        for (i, w) in workers.enumerated() {
            for (j, b) in bikes.enumerated() {
                bucket[calcDist(w, b)].append([i, j])
            }
        }

        var res = [Int](repeating: -1, count: W)
        var selectedB = Set<Int>()
        for d in 0 ..< D {
            for k in bucket[d] {
                if res[k[0]] != -1 || selectedB.contains(k[1]) {
                    continue
                }

                res[k[0]] = k[1]
                selectedB.insert(k[1])
            }
        }

        return res
    }

    func calcDist(_ w: [Int], _ b: [Int]) -> Int {
        return abs(w[0] - b[0]) + abs(w[1] - b[1])
    }
}
