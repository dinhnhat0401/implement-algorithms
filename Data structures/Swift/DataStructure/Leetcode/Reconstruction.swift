//
//  Reconstruction.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class Reconstruction {
    // topology BFS
    func sequenceReconstruction(_ org: [Int], _ seqs: [[Int]]) -> Bool {
        let N = org.count
        var g = [[Int]](repeating: [], count: N + 1)
        var degree = [Int](repeating: -1, count: N + 1) // out degree
        for s in seqs {
            if s.count == 0 {
                continue
            }

            guard s.count > 1 else {
                if s[0] < 0 || s[0] > N {
                    return false
                }
                if degree[s[0]] == -1 {
                    degree[s[0]] = 0
                }
                continue
            }

            var i = 0

            while i < s.count - 1 {
                if s[i] < 0 || s[i] > N {
                    return false
                }

                if s[i + 1] < 0 || s[i + 1] > N {
                    return false
                }

                if degree[s[i]] == -1 {
                    degree[s[i]] = 0
                }
                if degree[s[i + 1]] == -1 {
                    degree[s[i + 1]] = 0
                }

                degree[s[i]] += 1
                g[s[i + 1]].append(s[i])
                i += 1
            }
        }
        var leaves = [Int]()
        for (i, d) in degree.enumerated() {
            if d == 0 {
                leaves.append(i)
            }
        }

        var rec = [Int]()
        var visited = Set<Int>()
        while leaves.count > 0 {
            guard leaves.count == 1 else {
                return false
            }

            var next = [Int]()
            let l = leaves[0]
            visited.insert(l)
            rec.append(l)
            for nei in g[l] {
                if visited.contains(nei) {
                    continue
                }
                degree[nei] -= 1
                if degree[nei] == 0 {
                    next.append(nei)
                }
            }
            leaves = next
        }

        return org == rec.reversed()
    }
}
