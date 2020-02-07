//
//  RemoveStones.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/07.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class RemoveStones {
    func removeStones(_ stones: [[Int]]) -> Int {
        // calculate number of stones that share one coordinate with another stone
        // have 2 sets: coordX, coordY to keep track of available coordinate
        // this approach will lead to a wrong result
//         var coordX = Set<Int>()
//         var coordY = Set<Int>()
//         var result = 0
//         for s in stones {
//             if coordX.contains(s[0]) || coordY.contains(s[1]) {
//                 result += 1
//             }
//             coordX.insert(s[0])
//             coordY.insert(s[1])
//         }
//         return result
        let N = stones.count
        var g = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        for i in 0 ..< N {
            for j in i + 1 ..< N {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    g[i][0] += 1
                    g[i][g[i][0]] = j
                    g[j][0] += 1
                    g[j][g[j][0]] = i
                }
            }
        }
        var visited = Set<Int>()
        // count number of connected components
        var count = 0
        for s in 0 ..< N {
            if visited.contains(s) {
                continue
            }
            visited.insert(s)
            dfs(g, s, &visited)
            count += 1
        }

        return N - count
    }

    func dfs(_ g: [[Int]], _ s: Int, _ visited: inout Set<Int>) {
        var stack = [s]
        while stack.count > 0 {
            let n = stack.removeLast()
            if g[n][0] == 0 {
                continue
            }
            for i in 1 ... g[n][0] {
                if visited.contains(g[n][i]) {
                    continue
                }
                visited.insert(g[n][i])
                stack.append(g[n][i])
            }
        }
    }
}
