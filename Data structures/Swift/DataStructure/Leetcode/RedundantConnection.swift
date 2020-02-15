//
//  RedundantConnection.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class RedundantConnection {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var g = [Int: [Int]]()
        for e in edges {
            g[e[0], default: []].append(e[1])
            g[e[1], default: []].append(e[0])
        }

        let loop = dfs(1, g)
        var i = edges.count - 1
        while i >= 0 {
            if loop.contains(edges[i]) || loop.contains([edges[i][1], edges[i][0]]) {
                return edges[i]
            }
            i -= 1
        }

        return []
    }

    func dfs(_ s: Int, _ g: [Int: [Int]]) -> Set<[Int]> {
        var stack = [s]
        var visited = Set<Int>()
        var visiting = Set<Int>([s])
        var p = [Int](repeating: -1, count: g.count + 1)
        while stack.count > 0 {
            let n = stack.last!
            var finished = true
            for nei in g[n, default: []] {
                if visited.contains(nei) {
                    continue
                }

                if p[n] == nei {
                    continue
                }

                if visiting.contains(nei) {
                    // found loop here
                    var cur = nei
                    var prev = nei
                    var loop = Set<[Int]>()
                    while true {
                        cur = stack.removeLast()
                        loop.insert([prev, cur])
                        if cur == nei {
                            break
                        }
                        prev = cur
                    }
                    return loop
                }

                finished = false
                visiting.insert(nei)
                p[nei] = n
                stack.append(nei)
                break
            }
            if finished {
                visited.insert(n)
                stack.removeLast()
            }
        }

        return Set<[Int]>()
    }
}
