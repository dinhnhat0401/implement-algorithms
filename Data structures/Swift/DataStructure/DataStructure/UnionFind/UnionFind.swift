//
//  UnionFind.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/17.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class UnionFindNode<T> where T: Hashable {
    var data: T
    var rank: Int
    var p: UnionFindNode<T>?

    init(_ data: T) {
        self.data = data
        self.rank = 0
    }
}

extension UnionFindNode: Equatable {
    static func == (lhs: UnionFindNode<T>, rhs: UnionFindNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension UnionFindNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(rank)
    }
}

class UnionFind<T> where T: Hashable {
    func makeSet(_ data: T) -> UnionFindNode<T> {
        // Not makeSet twice for a same data
        guard nodes[data] == nil else {
            return nodes[data]!
        }

        let newNode = UnionFindNode(data)
        nodes[data] = newNode
        makeSet(newNode)
        return newNode
    }

    func makeSet(_ x: UnionFindNode<T>) {
        x.p = x
        x.rank = 0
    }

    func union(_ x: UnionFindNode<T>, _ y: UnionFindNode<T>) {
        link(findSet(x), findSet(y))
    }

    func link(_ x: UnionFindNode<T>, _ y: UnionFindNode<T>) {
        if x.rank > y.rank {
            y.p = x
        } else {
            x.p = y
            if x.rank == y.rank {
                y.rank += 1
            }
        }
    }

    func findSet(_ x: UnionFindNode<T>) -> UnionFindNode<T> {
        if x != x.p {
            x.p = findSet(x.p!)
        }

        return x.p!
    }

    private var nodes = [T: UnionFindNode<T>]()
}
