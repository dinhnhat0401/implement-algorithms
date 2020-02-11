//
//  ValidTree.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class ValidTree {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if n == 1 {
            return true
        }

        var g = [[Int]](repeating: [], count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }

        var p = [Int](repeating: -1, count: n)
        p[0] = 0
        if hasCycle(g, 0, &p) {
            return false
        }

        for i in 0 ..< n {
            if p[i] == -1 {
                return false
            }
        }

        return true
    }

    func hasCycle(_ g: [[Int]], _ n: Int, _ p: inout [Int]) -> Bool {
        for nei in g[n] {
            if p[nei] == -1 {
                p[nei] = n
            }

            if nei == p[n] {
                continue
            }

            if p[nei] != n {
                return true
            }

            if hasCycle(g, nei, &p) {
                return true
            }
        }

        return false
    }
}
