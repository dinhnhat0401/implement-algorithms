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

    func shortestPath2(_ grid: [[Int]], _ k: Int) -> Int {
        // idea:
        // BFS with each element has form: [row, column, number of eliminated obstacles, step]
        // also have a visited array to check if we visited the cell
        // -> [row, column, number of eliminated obstacles] -> Bool
        // enqueue first element [0, 0, k, 0]
        // while queue is not empty
            // dequeue get element e [r, c, re, step]
            // for direction in [[-1, 0], [1, 0], [0, - 1], [0, 1]]
                // enqueue if index1 in range [0, m), index2 in range [0, n)
                // mark cell with remain step as visited
                // end if we reached [m - 1, n - 1], return step

        // return -1
        let m = grid.count
        let n = grid[0].count

        if k >= m + n - 2 {
            return m + n - 2
        }

        var visited = Set<[Int]>()
        visited.insert([0, 0, k])
        var frontier = [[0, 0, k]]
        var level = 0

        while frontier.count > 0 {
            var next = [[Int]]()
            for e in frontier {
                let r = e[0]
                let c = e[1]
                let remain = e[2]

                // return right after we reach [m-1, n-1] cell
                if r == m - 1 && c == n - 1 {
                    return level
                }

                for d in [[-1, 0], [1, 0], [0, -1], [0, 1]] {
                    let newRow = r + d[0]
                    let newCol = c + d[1]

                    if newRow < 0 || newRow >= m || newCol < 0 || newCol >= n {
                        continue
                    }

                    let newRemain = remain - (grid[newRow][newCol] == 1 ? 1 : 0)
                    if newRemain < 0 {
                        continue
                    }

                    if visited.contains([newRow, newCol, newRemain]) {
                        continue
                    }

                    // return right after we reach [m-1, n-1] cell
                    if newRow == m - 1 && newCol == n - 1 {
                        return level + 1
                    }

                    next.append([newRow, newCol, newRemain])
                    // mark current cell as visited
                    // it's important to mark [newRow, newCol, newRemain] as visited
                    // so we can avoid many repeated work with other cells in the same frontier
                    visited.insert([newRow, newCol, newRemain])
                }
            }

            level += 1
            frontier = next
        }

        return -1
    }

    func shortestPath3(_ grid: [[Int]], _ k: Int) -> Int {
        // idea:
        // BFS with each element has form: [row, column, number of eliminated obstacles, step]
        // also have a visited array to check if we visited the cell
        // -> [row, column, number of eliminated obstacles] -> Bool
        // enqueue first element [0, 0, k, 0]
        // while queue is not empty
            // dequeue get element e [r, c, re, step]
            // for direction in [[-1, 0], [1, 0], [0, - 1], [0, 1]]
                // enqueue if index1 in range [0, m), index2 in range [0, n)
                // mark cell with remain step as visited
                // end if we reached [m - 1, n - 1], return step

        // return -1
        let m = grid.count
        let n = grid[0].count

        if k >= m + n - 2 {
            return m + n - 2
        }

        var visited = Set<[Int]>()
        visited.insert([0, 0, k])
        var frontier = [[0, 0, k]]
        var level = 0

        while frontier.count > 0 {
            var next = [[Int]]()
            for e in frontier {
                let r = e[0]
                let c = e[1]
                let remain = e[2]

                // return right after we reach [m-1, n-1] cell
                if remain >= m + n - 3 - r - c {
                    return level + m + n - 2 - r - c
                }

                for d in [[-1, 0], [1, 0], [0, -1], [0, 1]] {
                    let newRow = r + d[0]
                    let newCol = c + d[1]

                    if newRow < 0 || newRow >= m || newCol < 0 || newCol >= n {
                        continue
                    }

                    var newRemain = remain - (grid[newRow][newCol] == 1 ? 1 : 0)
                    if newRemain < 0 {
                        continue
                    }

                    if visited.contains([newRow, newCol, newRemain]) {
                        continue
                    }

                    // return right after we reach the cell that we know we can eliminate all obstacles if available on our way to [m-1, n-1]
                    // This's called Manhattan trick
                    // check this content:
                    // https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/discuss/453652/Manhattan-distance-instead-of-normal-goal-check
                    if newRemain >= m + n - 3 - newRow - newCol {
                        return level + 1 + m + n - 2 - newRow - newCol
                    }

                    next.append([newRow, newCol, newRemain])
                    // mark current cell as visited
                    // it's important to mark [newRow, newCol, newRemain] as visited so we can avoid many repeated work with other cells in the same frontier
                    visited.insert([newRow, newCol, newRemain])
                }
            }

            level += 1
            frontier = next
        }

        return -1
    }
}
