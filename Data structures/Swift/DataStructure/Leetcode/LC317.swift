//
//  LC317.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/05/07.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC317 {
    func shortestDistance(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return -1
        }

        var grid = grid
        var buildings = [[Int]]()
        let loc = findBuidlingsAndLoc(&grid, &buildings)
        if loc.count == 0 {
            return -1
        }
        print(loc)
        var res = 0
        for b in buildings {
            res += (abs(b[0] - loc[0]) + abs(b[1] - loc[1]))
        }

        return res
    }

    func findBuidlingsAndLoc(_ grid: inout [[Int]], _ buildings: inout [[Int]]) -> [Int] {
        let dirs = [[0, -1], [-1, 0], [0, 1], [1, 0]]
        let R = grid.count
        let C = grid[0].count

        var frontier = [[Int]]()
        for r in 0 ..< R {
            for c in 0 ..< C {
                if grid[r][c] == 1 {
                    frontier.append([r, c])
                }
            }
        }
        buildings = frontier
        let totalBuilding = frontier.count
        while frontier.count > 0 {
            var next = [[Int]]()
            for n in frontier {
                for d in dirs {
                    let newPos = [n[0] + d[0], n[1] + d[1]]
                    if newPos[0] < 0 || newPos[0] >= R || newPos[1] < 0 || newPos[1] >= C || grid[newPos[0]][newPos[1]] > 0 {
                        continue
                    }

                    grid[newPos[0]][newPos[1]] -= 1
                    if grid[newPos[0]][newPos[1]] == -totalBuilding {
                        return newPos
                    }
                }
            }
            frontier = next
        }

        return []
    }
}
