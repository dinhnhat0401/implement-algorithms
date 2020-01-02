//
//  IslandPerimeter.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

class IslandPerimeter {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        // start from [0, 0]
        // initialize a visited array to keep track of grid that we are visited
        // try to find the island's first grid
            // mark first grid as visited
            // calculate number of water or bound adjacent with current grid then add it to perimeter
        // from the first grid try to reach other grids
        // for each grid that connected to first grid
            // calculate number of water or bound adjacent with current grid then add it to perimeter

        var visited = Set<[Int]>()
        var perimeter = 0
        for r in 0 ..< grid.count {
            for c in 0 ..< grid[0].count {
                if grid[r][c] == 1 {
                    bfs(grid, &visited, r, c, &perimeter)
                    return perimeter
                }
            }
        }

        return 0
    }

    func bfs(_ grid: [[Int]], _ visited: inout Set<[Int]>, _ r: Int, _ c: Int, _ perimeter: inout Int) {
        if r < 0 || r >= grid.count || c < 0 || c >= grid[0].count || grid[r][c] == 0 {
            perimeter += 1
            return
        }

        if grid[r][c] == 1  && !visited.contains([r, c]) {
            visited.insert([r, c])
            for d in directions {
                bfs(grid, &visited, r + d[0], c + d[1], &perimeter)
            }
        }
    }

    let directions = [[0, -1], [-1, 0], [0, 1], [1, 0]]
}
