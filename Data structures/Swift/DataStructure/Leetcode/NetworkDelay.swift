//
//  NetworkDelay.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/14.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class NetworkDelay {
    let MAX_TIME = 100 * 600
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var g = [[[Int]]](repeating: [], count: N)
        for t in times {
            g[t[0] - 1].append([t[1] - 1, t[2]])
        }

        var dist = [Int](repeating: MAX_TIME, count: N)
        dist[K - 1] = 0
        let q = PriorityQueue743(N)
        for i in 0 ..< N {
            if i == K - 1 {
                q.add([i, 0])
                continue
            }
            q.add([i, MAX_TIME])
        }

        var visited = Set<[Int]>()
        while q.size > 0 {
            let n = q.extractMin()
            if visited.contains(n) {
                continue
            }
            // relax all edges from n
            for nei in g[n[0]] {
                if dist[nei[0]] > dist[n[0]] + nei[1] {
                    dist[nei[0]] = dist[n[0]] + nei[1]
                    q.change(nei[0], [nei[0], dist[nei[0]]])
                }
            }
            visited.insert(n)
        }

        var maxV = dist[0]
        for i in 0 ..< N {
            maxV = max(maxV, dist[i])
        }

        return maxV == MAX_TIME ? -1 : maxV
    }
}

class PriorityQueue743 {
    init(_ maxSize: Int) {
        nodes = [[Int]](repeating: [], count: maxSize)
        keys = [Int](repeating: 0, count: maxSize)
    }

    func add(_ val: [Int]) {
        if size == nodes.count {
            return
        }

        nodes[size] = val
        keys[val[0]] = size
        size += 1
        shiftUp(size - 1)
    }

    func change(_ n: Int, _ newVal: [Int]) {
        let i = keys[n]
        nodes[i] = newVal
        shiftUp(i)
        shiftDown(i)
    }

    func extractMin() -> [Int] {
        if size == 0 {
            return []
        }

        let val = nodes[0]
        nodes.swapAt(0, size - 1)
        size -= 1
        shiftDown(0)
        return val
    }

    func shiftUp(_ i: Int) {
        var i = i
        while nodes[i][1] < nodes[parent(i)][1] {
            nodes.swapAt(i, parent(i))
            keys[nodes[i][0]] = i
            keys[nodes[parent(i)][0]] = parent(i)
            i = parent(i)
        }
    }

    func shiftDown(_ i: Int) {
        var i = i
        while i < size {
            let l = left(i)
            let r = right(i)
            var swapTo = i
            if l < size && nodes[swapTo][1] > nodes[l][1] {
                swapTo = l
            }
            if r < size && nodes[swapTo][1] > nodes[r][1] {
                swapTo = r
            }
            if i == swapTo {
                return
            }

            nodes.swapAt(i, swapTo)
            keys[nodes[i][0]] = i
            keys[nodes[swapTo][0]] = swapTo
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
    var keys: [Int]
}
