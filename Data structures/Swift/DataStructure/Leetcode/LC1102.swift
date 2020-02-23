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

    func maximumMinimumPath2(_ A: [[Int]]) -> Int {
        // use a max queue to keep track of index and max path value
        // initialize queue with elements: [0, 0, A[0][0]], [0, 1, --], ...
        guard A.count > 0 else {
            return -1
        }

        let R = A.count
        let C = A[0].count
        var q = PriorityQueue1102(R * C, { (a1, a2) -> Bool in
            a1[2] > a2[2]
        })
        q.add([0, 0, A[0][0]])
        var visited = Set<[Int]>([[0, 0]])
        var score = Int.max
        while q.size > 0 {
            let cur = q.poll()
            score = min(score, cur[2])
            if cur[0] == (R-1) && cur[1] == (C-1) {
                break
            }
            for d in dirs {
                let newPos = [cur[0] + d[0], cur[1] + d[1]]
                if newPos[0] < 0 || newPos[0] >= R || newPos[1] < 0 || newPos[1] >= C || visited.contains(newPos) {
                    continue
                }
                visited.insert([newPos[0], newPos[1]])
                q.add([newPos[0], newPos[1], A[newPos[0]][newPos[1]]])
            }
        }

        return score
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

class PriorityQueue1102 {
    private var comparator: ([Int], [Int]) -> Bool
    init(_ maxSize: Int, _ comparator: @escaping ([Int], [Int]) -> Bool) {
        self.nodes = [[Int]](repeating: [], count: maxSize)
        self.comparator = comparator
    }

    func add(_ val: [Int]) {
        nodes[size] = val
        size += 1
        shiftUp(size - 1)
    }

    func poll() -> [Int] {
        let val = nodes[0]
        nodes.swapAt(0, size - 1)
        size -= 1
        shiftDown(0)
        return val
    }

    func shiftUp(_ i: Int) {
        var i = i
        while comparator(nodes[i], nodes[parent(i)]) {
            nodes.swapAt(i, parent(i))
            if i == parent(i) {
                break
            }
            i = parent(i)
        }
    }

    func shiftDown(_ i: Int) {
        var i = i
        while i < size {
            let l = left(i)
            let r = right(i)
            var swapTo = i
            if l < size && comparator(nodes[l], nodes[swapTo]) {
                swapTo = l
            }
            if r < size && comparator(nodes[r], nodes[swapTo]) {
                swapTo = r
            }
            if i == swapTo {
                return
            }

            nodes.swapAt(i, swapTo)
            i = swapTo
        }
    }

    func left(_ i: Int) -> Int {
        return i * 2 + 1
    }

    func right(_ i: Int) -> Int {
        return i * 2 + 2
    }

    func parent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    var size = 0
    var nodes:[[Int]]
}
