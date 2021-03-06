//
//  LC347.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/09.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default: 0] += 1
        }
        var q = PriorityQueue347_<PQNode>(k)
        for k in dict.keys {
            q.add(PQNode(k, dict[k]!))
        }

        var res = [Int]()
        while q.count > 0 {
            res.append(q.poll()!.val)
        }

        return res.reversed()
    }
}

class PQNode: Comparable {
    static func < (lhs: PQNode, rhs: PQNode) -> Bool {
        return lhs.freq < rhs.freq
    }

    static func == (lhs: PQNode, rhs: PQNode) -> Bool {
        return lhs.freq == rhs.freq && lhs.val == rhs.val
    }

    var val: Int
    var freq: Int
    init(_ val: Int, _ freq: Int) {
        self.val = val
        self.freq = freq
    }
}

struct PriorityQueue347_<T> where T: Comparable {
    init(_ size: Int) {
        self.MAX_SIZE = size
        self.count = 0
        self.nodes = [T]()
    }

    mutating func add(_ n: T) {
        if count == MAX_SIZE {
            let curM = peek()
            if n <= curM {
                return
            }

            _ = poll()
        }

        count += 1
        if nodes.count < count {
            nodes.append(n)
        } else {
            nodes[count - 1] = n
        }
        shiftUp(count - 1)
    }

    func peek() -> T {
        return nodes[0]
    }

    mutating func poll() -> T? {
        if count == 0 {
            return nil
        }

        let res = nodes[0]
        nodes[0] = nodes[count - 1]
        count -= 1
        shiftDown(0)
        return res
    }

    mutating func shiftUp(_ i: Int) {
        var i = i
        while i >= 0 && nodes[i] < nodes[parent(i)] {
            nodes.swapAt(i, parent(i))
            i = parent(i)
        }
    }

    mutating func shiftDown(_ i: Int) {
        var i = i
        var swap = i
        while i < count {
            let l = left(i)
            let r = right(i)
            if l < count && nodes[l] < nodes[i] {
                swap = l
            }
            if r < count && nodes[r] < nodes[swap] {
                swap = r
            }

            guard swap != i else {
                break
            }

            nodes.swapAt(i, swap)
            i = swap
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

    var MAX_SIZE: Int
    var count: Int
    private var nodes: [T]
}

struct PriorityQueue347 {
    init(_ size: Int) {
        self.MAX_SIZE = size
        self.count = 0
        self.nodes = [[Int]](repeating: [], count: size)
    }

    mutating func add(_ n: [Int]) {
        if count == MAX_SIZE {
            let curM = peek()
            if curM[1] > n[1] {
                return
            }

            _ = poll()
        }

        count += 1
        nodes[count - 1] = n
        shiftUp(count - 1)
    }

    func peek() -> [Int] {
        return nodes[0]
    }

    mutating func poll() -> [Int] {
        if count == 0 {
            return []
        }

        let res = nodes[0]
        nodes[0] = nodes[count - 1]
        count -= 1
        shiftDown(0)
        return res
    }

    mutating func shiftUp(_ i: Int) {
        var i = i
        while i >= 0 && nodes[i][1] < nodes[parent(i)][1] {
            nodes.swapAt(i, parent(i))
            i = parent(i)
        }
    }

    mutating func shiftDown(_ i: Int) {
        var i = i
        var swap = i
        while i < count {
            let l = left(i)
            let r = right(i)
            if l < count && nodes[l][1] < nodes[i][1] {
                swap = l
            }
            if r < count && nodes[r][1] < nodes[swap][1] {
                swap = r
            }

            guard swap != i else {
                break
            }

            nodes.swapAt(i, swap)
            i = swap
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

    var MAX_SIZE: Int
    var count: Int
    private var nodes: [[Int]]
}
