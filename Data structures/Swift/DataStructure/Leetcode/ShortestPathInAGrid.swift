//
//  https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/
//  ShortestPath.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/16.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class ShortestPathInAGrid {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: 9999, count: grid[0].count), count: grid.count)
        return bfs(grid, 0, 0, k, 0, &memo)
    }

    func bfs(_ grid: [[Int]], _ r: Int, _ c: Int, _ remain: Int, _ step: Int, _ memo: inout [[Int]]) -> Int {
        var grid = grid
        if r < 0 || c < 0 || r >= grid.count || c >= grid[0].count
            || remain < 0 || memo[r][c] < step || (grid[r][c] == 1 && remain < 1) {
            return 9999
        }

        if r == grid.count - 1 && c == grid[0].count - 1 {
            memo[r][c] = step
            return step
        }

        let nextRemain = remain - (grid[r][c] == 1 ? 1 : 0)

        let left = bfs(grid, r - 1, c, nextRemain, step + 1, &memo)
        let right = bfs(grid, r + 1, c, nextRemain, step + 1, &memo)
        let up = bfs(grid, r, c - 1, nextRemain, step + 1, &memo)
        let down = bfs(grid, r, c + 1, nextRemain, step + 1, &memo)

        var result = 9999
        result = min(result, left)
        result = min(result, right)
        result = min(result, up)
        result = min(result, down)

        if result == 9999 {
            return -1
        }

        return result
    }
}
