//
//  RegionBySlashes.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/13.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class RegionBySlashes {
    var N = 0
    func regionsBySlashes(_ grid: [String]) -> Int {
        // approach 1
        // zoom in the grid to n * 3 x n * 3
        // so each slash will belong to one separate column in the new grid and we can use
        // dfs or union find to calculate number of connected components in the grid

        // approach 2
        // zoom n*2 x n*2 and use union find
        N = grid.count
        let uf = UnionFind959(N * N * 4)
        for r in 0 ..< N {
            let s = Array(grid[r])
            for c in 0 ..< N {
                if r > 0 {
                    uf.union(uf.makeSet(g(r - 1, c, 3)), uf.makeSet(g(r, c, 1)))
                }
                if c > 0 {
                    uf.union(uf.makeSet(g(r, c - 1, 2)), uf.makeSet(g(r, c, 0)))
                }
                if s[c] == "\\" {
                    uf.union(uf.makeSet(g(r, c, 0)), uf.makeSet(g(r, c, 3)))
                    uf.union(uf.makeSet(g(r, c, 1)), uf.makeSet(g(r, c, 2)))
                }

                if s[c] == "/" {
                    uf.union(uf.makeSet(g(r, c, 0)), uf.makeSet(g(r, c, 1)))
                    uf.union(uf.makeSet(g(r, c, 2)), uf.makeSet(g(r, c, 3)))
                }
            }
        }
        return uf.count
    }

    func g(_ r: Int, _ c: Int, _ k: Int) -> Int {
        return (r * N + c) * 4 + k
    }
}

class UnionFind959 {
    init(_ size: Int) {
        self.nodes = [Node959?](repeating: nil, count: size)
        count = 0
    }

    func union(_ x: Node959, _ y: Node959) {
        let rootX = findSet(x)
        let rootY = findSet(y)
        if rootX.val != rootY.val {
            link(rootX, rootY)
            count -= 1
        }
    }

    func link(_ x: Node959, _ y: Node959) {
        if x.rank >= y.rank {
            y.p = x
            if x.rank == y.rank {
                x.rank += 1
            }
        } else {
            x.p = y
        }
    }

    func findSet(_ x: Node959) -> Node959 {
        if x.val != x.p!.val {
            x.p = findSet(x.p!)
        }

        return x.p!
    }

    func makeSet(_ val: Int) -> Node959 {
        if nodes[val] != nil {
            return nodes[val]!
        }

        let n = Node959(val)
        nodes[val] = n
        n.p = n
        count += 1
        return nodes[val]!
    }

    var nodes: [Node959?]
    var count: Int
}

class Node959 {
    var rank: Int
    var val: Int
    var p: Node959?

    init(_ val: Int) {
        self.val = val
        self.rank = 0
    }
}
