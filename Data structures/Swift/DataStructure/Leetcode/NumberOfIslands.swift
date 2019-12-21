//
//  NumberOfIslands.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/21.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        // initialize count = 0
        // go through all elements in grid
            // if element is a '1' and is not visited
                // increase count
                // do BFS with direction in [[-1, 0], [1, 0], [0, -1], [0, 1]]
                    // frontier = [current cell]
                    // while frontier is not empty
                        // initialize an array next to store cell index
                        // check other cells in direction [[-1, 0], [1, 0], [0, -1], [0, 1]]
                        // if cell is in bound, also value is '1'
                            // mark cell as visited by adding it to visited
                            // add cell to next
                    // frontier = next
                // use a visited set to keep track of all visited cell Set<[Int]>
        // return count

        if grid.count == 0 {
            return 0
        }

        let direction = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        let M = grid.count
        let N = grid[0].count

        var count = 0
        var visited = Set<[Int]>()
        for i in 0 ..< M {
            for j in 0 ..< N {
                if grid[i][j] == "1" && !visited.contains([i, j]) {
                    count += 1

                    // do BFS
                    var frontier = [[i, j]]
                    while frontier.count > 0 {
                        var next = [[Int]]()
                        for e in frontier {
                            for d in direction {
                                let newE = [e[0] + d[0], e[1] + d[1]]
                                if newE[0] >= 0 && newE[0] < M &&
                                newE[1] >= 0 && newE[1] < N &&
                                grid[newE[0]][newE[1]] == "1" && !visited.contains(newE) {
                                    visited.insert(newE)
                                    next.append(newE)
                                }
                            }
                        }

                        frontier = next
                    }
                }
            }
        }

        return count
    }
}
