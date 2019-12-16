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
    private let INF = 9999

    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let result = bfs(grid, 0, 0, k, 0)
        return result == INF ? -1 : result
    }

    func bfs(_ grid: [[Int]], _ r: Int, _ c: Int, _ remain: Int, _ step: Int) -> Int {
        var grid = grid
        if r < 0 || c < 0 || r >= grid.count || c >= grid[0].count || remain < 0 || grid[r][c] == 2 || (grid[r][c] == 1 && remain < 1) {
            return INF
        }

        if r == grid.count - 1 && c == grid[0].count - 1 {
            return step
        }

        let nextRemain = remain - (grid[r][c] == 1 ? 1 : 0)
        grid[r][c] = 2

        let left = bfs(grid, r - 1, c, nextRemain, step + 1)
        let right = bfs(grid, r + 1, c, nextRemain, step + 1)
        let up = bfs(grid, r, c - 1, nextRemain, step + 1)
        let down = bfs(grid, r, c + 1, nextRemain, step + 1)

        var result = INF
        result = min(result, left)
        result = min(result, right)
        result = min(result, up)
        result = min(result, down)

        return result
    }
}
