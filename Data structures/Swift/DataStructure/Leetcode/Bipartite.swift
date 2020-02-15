//
//  Bipartite.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class Bipartite {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let N = graph.count
        var color = [Int](repeating: -1, count: N)
        for i in 0 ..< N {
            if color[i] != -1 {
                continue
            }

            if !bfs(i, graph, &color) {
                return false
            }
        }

        return true
    }

    func bfs(_ s: Int, _ g: [[Int]], _ c: inout [Int]) -> Bool {
        var frontier = [s]
        c[s] = 0
        while frontier.count > 0 {
            var next = [Int]()
            for n in frontier {
                for nei in g[n] {
                    if c[nei] == c[n] {
                        return false
                    }

                    if c[nei] != -1 {
                        continue
                    }

                    c[nei] = 1 - c[n]
                    next.append(nei)
                }
            }
            frontier = next
        }

        return true
    }
}
