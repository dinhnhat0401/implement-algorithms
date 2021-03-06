//
//  AllPathsFromSourceToTarget.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/23.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//  https://leetcode.com/problems/all-paths-from-source-to-target/submissions/
//

import Foundation

class AllPathsFromSourceToTarget {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        // DFS + Backtracking
        // dfs from node 0
        // for each node
            // insert node into a path [Int]
            // if current node is the destination (node N-1)
                // add path to a result list ([[Int]])
                // return
            //
            // for each node's neighbor
                // add neighbor to path
                // dfs for neighbor
                // backtracking by removing last node from path
        // Analytics:
        // Time complexity: O(2^N * N^2)
        // There exists two possibilities for each node (except for the first and the last): appearing or not appearing in the path. Therefore, we have 1*2*...*2*1 = 2^(N-2) possibilities for paths.
        // For each path, there are at most N nodes, which collected one by one, each cost O(N)
        // Space complexity: O(2^N * N) the size of the output dominating the final space complexity.

        var result = [[Int]]()
        var path = [0] // path starts from node 0
        dfs(graph, 0, &path, &result)
        return result
    }

    func dfs(_ graph: [[Int]], _ node: Int, _ path: inout [Int], _ result: inout [[Int]]) {
        if node == graph.count - 1 { // path ends at node N - 1
            result.append(path)
        }

        for n in graph[node] {
            path.append(n)
            dfs(graph, n, &path, &result)
            path.removeLast() // backtracking
        }
    }
}
