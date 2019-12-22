//
//  NumberOfIslands2.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/21.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//
// https://leetcode.com/problems/number-of-islands-ii

import Foundation

class NumberOfIslands2 {
    // TLE
    func numIslands2(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {
        // Assume all four edges of the grid are all surrounded by water
        // use union-find data structure
        // results is an array to store results
        // use a list of set to store island: {[[0,0], [0,1]], [[1,2]], [[2,1]]} -> list: Set<[Int]>
        // for each newly added position - newPos
            // assume that position is in bound
            // go through each set in list
                // if set and the set created by newPos - newSet and its adjacencies is NOT disjointed
                    // union newSetToAdd (which contain position) with the set
                    // add set to the list of set need to be removed
            // insert newSetToAdd to list
            // Remove all list in removeList from list
            // insert list.count to result
        // TIME COMPLEXITY: O(k * M * N)
        // SPACE COMPLEXITY: O(M * N) as required by UnionFind data structure

        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

        var results = [Int]()
        var list = Set<Set<[Int]>>()
        for position in positions {
            var newSet:Set<[Int]> = [position]
            for d in directions {
                let newPos = [position[0] + d[0], position[1] + d[1]]
                if newPos[0] >= 0 && newPos[0] < m && newPos[1] >= 0 && newPos[1] < n {
                    newSet.insert(newPos)
                }
            }

            // var removeList = [Set<[Int]>]()
            var newSetToAdd:Set<[Int]> = [position]
            for set in list {
                if !set.isDisjoint(with: newSet) {
                    newSetToAdd = newSetToAdd.union(set)
                    list.remove(set)
                }
            }

            // // need to remove all set before adding newSetToAdd to avoid the case that
            // // newSetToAdd is equal to set (the set will be removed)
            // list.removeAll(where: { removeList.contains($0) })
            list.insert(newSetToAdd)

            results.append(list.count)
        }

        return results
    }

    func numIslands22(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {
        // Assume all four edges of the grid are all surrounded by water
        // use union-find data structure

        var result = [Int]()
        var uf = UnionFind1(m * n)

        for p in positions {
            // for each [r, c] in position
            let r = p[0]
            let c = p[1]
            // set position r * n + c using uf's set function to increase island count
            let x = r * n + c
            uf.set(x)

            // check all adjacency to see if any island already valid at that position
            // if any valid, try to union index with that island
            var overlap = [Int]()
            if r - 1 >= 0 && uf.isValid((r - 1) * n + c) {
                overlap.append((r - 1) * n + c)
            }
            if r + 1 < m && uf.isValid((r + 1) * n + c) {
                overlap.append((r + 1) * n + c)
            }
            if c - 1 >= 0 && uf.isValid(r * n + c - 1) {
                overlap.append(r * n + c - 1)
            }
            if c + 1 < n && uf.isValid(r * n + c + 1) {
                overlap.append(r * n + c + 1)
            }

            for i in overlap {
                uf.union(x, i)
            }

            result.append(uf.count)
        }

        return result
    }
}

// class UnionFind
// methods:
// union: union two indexes, in this case to union two islands into one bigger island
// Note: use rank to maintain height of parent tree at most equal to 1
// Note: rank, parent are two arrays
// parent is the island that the index belong to
// trick: instead of two dimentions array, we can calculate r * m + c and represent value in an one dimention array
public struct UnionFind1 {
    public private(set) var parent:[Int]
    private var rank:[Int]
    public private(set) var count: Int

    init(_ N: Int) {
        parent = [Int](repeating: -1, count: N)
        rank = [Int](repeating: 0, count: N)
        count = 0
    }

    public mutating func union(_ x: Int, _ y: Int) {
        link(find(x), find(y))
    }

    public mutating func link(_ x: Int, _ y: Int) {
        if x == y {
            return
        }

        if rank[x] > rank[y] {
            parent[y] = x
        } else {
            parent[x] = y
            // only increasing ranking of x or y if rank(x) is equal rank(y)
            if rank[y] == rank[x] {
                rank[y] += 1
            }
        }

        count -= 1
    }

    public mutating func find(_ x: Int) -> Int {
        // To be able to reach parent after at most one trace
        // we need to set parent of all node in the path to root node to root
        // recursively
        if parent[x] != x {
            parent[x] = find(parent[x])
        }

        return parent[x]

//         // non-recursively
//         var root = x
//         while parent[root] != root {
//             root = parent[root]
//         }

//         var _x = x
//         while parent[_x] != _x {
//             parent[_x] = root
//             _x = parent[_x]
//         }
    }

    public mutating func set(_ x: Int) {
        // no need to do anything if the position is already set
        guard parent[x] == -1 else {
            return
        }

        parent[x] = x
        count += 1
    }

    public func isValid(_ x: Int) -> Bool {
        return parent[x] != -1
    }
}
