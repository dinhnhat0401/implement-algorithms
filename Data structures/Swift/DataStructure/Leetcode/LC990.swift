//
//  LC990.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/20.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC990 {
    let a = Int(Character("a").asciiValue!)
    let z = Int(Character("z").asciiValue!)
    func equationsPossible(_ equations: [String]) -> Bool {
        var ne = [Int: Set<Int>]()
        var g = [[Int]](repeating: [], count: z - a + 1)
        for e in equations {
            let arr = Array(e)
            let x = Int(arr[0].asciiValue!) - a
            let y = Int(arr[3].asciiValue!) - a
            if arr[1] == "!" {
                ne[x, default: Set<Int>()].insert(y)
                ne[y, default: Set<Int>()].insert(x)
            } else {
                g[x].append(y)
                g[y].append(x)
            }
        }

        var visited = Set<Int>()

        for i in 0 ... (z - a) {
            if visited.contains(i) {
                continue
            }

            let visiting = bfs(i, g)
            var neSet = Set<Int>()
            for j in visiting {
                neSet = neSet.union(ne[j, default: []])
            }
            if !visiting.isDisjoint(with: neSet) {
                return false
            }
            visited = visited.union(visiting)
        }

        return true
    }

    func bfs(_ s: Int, _ g: [[Int]]) -> Set<Int> {
        var frontier = [s]
        var v = Set<Int>([s])
        while frontier.count > 0 {
            var next = [Int]()
            for n in frontier {
                for nei in g[n] {
                    if v.contains(nei) {
                        continue
                    }
                    v.insert(nei)
                    next.append(nei)
                }
            }
            frontier = next
        }

        return v
    }
}
