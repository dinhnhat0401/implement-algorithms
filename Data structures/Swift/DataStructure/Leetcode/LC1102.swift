//
//  LC1102.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC1102 {
    func maximumMinimumPath(_ A: [[Int]]) -> Int {
        let R = A.count
        let C = A[0].count
        let uf = UnionFind1102(R * C + 1)
        var points = [[Int]]()
        for r in 0 ..< R {
            for c in 0 ..< C {
                points.append([r, c])
            }
        }
        points.sort(by: { A[$0[0]][$0[1]] > A[$1[0]][$1[1]] })
        var seen = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
        for p in points {
            let r = p[0]
            let c = p[1]
            seen[r][c] = true
            uf.make(r * C + c)
            for d in dirs {
                let newPos = [r + d[0], c + d[1]]
                if newPos[0] < 0 || newPos[0] >= R || newPos[1] < 0 || newPos[1] >= C || !seen[newPos[0]][newPos[1]] {
                    continue
                }
                uf.union(r * C + c , newPos[0] * C + newPos[1])
                if uf.find(0) != -1 && uf.find(0) == uf.find(R * C - 1) {
                    return A[r][c]
                }
            }
        }
        return -1
    }

    let dirs = [[-1, 0], [0, -1], [1, 0], [0, 1]]
}

class UnionFind1102 {
    init(_ size: Int) {
        rank = [Int](repeating: -1, count: size)
        p = [Int](repeating: -1, count: size)
    }

    func make(_ i: Int) {
        guard p[i] == -1 else {
            return
        }

        p[i] = i
        rank[i] = 0
    }

    func find(_ i: Int) -> Int {
        var i = i
        var j = i
        if p[i] == -1 {
            return -1
        }

        while i != p[i] {
            i = p[i]
        }

        while j != p[j] {
            j = p[j]
        }

        return i
    }

    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)

        if rootX == rootY {
            return
        }

        link(rootX, rootY)
    }

    func link(_ x: Int, _ y: Int) {
        if rank[x] >= rank[y] {
            p[y] = x
            if rank[x] == rank[y] {
                rank[x] += 1
            }
        } else {
            p[x] = y
        }
    }

    // var nodes: [Int]
    var rank: [Int]
    var p: [Int]
}
