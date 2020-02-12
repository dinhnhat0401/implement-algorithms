//
//  MinimumHeightTrees.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class MinimumHeightTrees {
    // Brute force O(N^2) - TLE
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var g = [[Int]](repeating: [], count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }

        var heights = [Int](repeating: Int.max, count: n)
        var minH = Int.max
        var visited = [Bool](repeating: false, count: g.count)
        for i in 0 ..< n {
            heights[i] = findHeight(i, g, &visited)
            minH = min(heights[i], minH)
        }

        var result = [Int]()
        for (i, h) in heights.enumerated() {
            if h == minH {
                result.append(i)
            }
        }

        return result
    }

    func findHeight(_ root: Int, _ g: [[Int]], _ visited: inout [Bool]) -> Int {
        visited[root] = true
        var h = 1

        for nei in g[root] {
            if visited[nei] {
                continue
            }
            visited[nei] = true
            h = max(h, findHeight(nei, g, &visited) + 1)
        }
        visited[root] = false // backtracking

        return h
    }

    // Get a random note (or can get 0 for convenience) r
    // Find the longest path start from r, call `s` as the end node of that path
    // Find the longest path start from `s`: `s` -> `e`
    // We can prove that s->e is the longest path in the current tree
    // the result is middle node of this path
    // How to prove that s -> e is the longest path in the tree?

    func findMinHeightTrees2(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var g = [[Int]](repeating: [], count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }

        var p = [Int](repeating: -1, count: n)
        var dist = [Int](repeating: -1, count: n)
        bfs(0, g, &p, &dist)

        var maxD = Int.min
        var start = 0
        for (i, d) in dist.enumerated() {
            if maxD < d {
                start = i
                maxD = d
            }
        }

        p = [Int](repeating: -1, count: n)
        bfs(start, g, &p, &dist)

        maxD = Int.min
        var end = start
        for (i, d) in dist.enumerated() {
            if maxD < d {
                end = i
                maxD = d
            }
        }
        var path = [Int]()
        while (end != start) {
            path.append(end)
            end = p[end]
        }
        path.append(start)
        if path.count % 2 == 1 {
            return [path[path.count/2]]
        }

        return [path[path.count/2 - 1], path[path.count/2]]
    }

    func bfs(_ n: Int, _ g: [[Int]], _ p: inout [Int], _ dist: inout [Int]) {
        var frontier = [n]
        var level = 1
        dist[n] = 0
        p[n] = n
        while frontier.count > 0 {
            var next = [Int]()
            for node in frontier {
                for nei in g[node] {
                    if p[nei] != -1 {
                        continue
                    }
                    p[nei] = node
                    dist[nei] = level
                    next.append(nei)
                }
            }
            frontier = next
            level += 1
        }
    }

    // Topology BFS
    func findMinHeightTrees3(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 {
            return [0]
        }

        var g = [[Int]](repeating: [], count: n)
        var degree = [Int](repeating: 0, count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
            degree[e[0]] += 1
            degree[e[1]] += 1
        }

        var leaves = [Int]()
        for i in 0 ..< n {
            if degree[i] == 1 {
                leaves.append(i)
            }
        }

        var result = [Int]()
        while leaves.count > 0 {
            result = leaves
            var newLeaves = [Int]()
            for l in leaves {
                degree[l] -= 1

                for nei in g[l] {
                    if degree[nei] < 1 {
                        continue
                    }

                    degree[nei] -= 1
                    if degree[nei] == 1 {
                        newLeaves.append(nei)
                    }
                }
            }
            leaves = newLeaves
        }

        return result
    }
}
