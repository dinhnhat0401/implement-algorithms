//
//  NetworkDelay.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/14.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class NetworkDelay {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var g = [[[Int]]](repeating: [], count: N)
        for t in times {
            g[t[0] - 1].append([t[1] - 1, t[2]])
        }

        var dist = [Int](repeating: Int.max, count: N)
        dist[K - 1] = 0
        let q = PriorityQueue743(N)
        q.add([K - 1, 0])
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
                }
                q.add(nei)
            }
            visited.insert(n)
        }

        var maxV = dist[0]
        for i in 0 ..< N {
            maxV = max(maxV, dist[i])
        }

        return maxV == Int.max ? -1 : maxV
    }
}

class PriorityQueue743 {
    init(_ maxSize: Int) {
        nodes = [[Int]](repeating: [], count: maxSize)
    }

    func add(_ val: [Int]) {
        if size == nodes.count {
            return
        }

        nodes[size] = val
        size += 1
        shiftUp(size - 1)
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
        return i / 2
    }

    var size = 0
    var nodes:[[Int]]
}
