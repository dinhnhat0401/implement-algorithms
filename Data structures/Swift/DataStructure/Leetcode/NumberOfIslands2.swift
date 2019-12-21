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
}
