//
//  CanFinish.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class CanFinish {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var g = [[Int]](repeating: [], count: numCourses)
        for p in prerequisites {
            g[p[0]].append(p[1])
        }

        var visiting = Set<Int>()
        var visited = Set<Int>()

        for i in 0 ..< numCourses {
            if visited.contains(i) {
                continue
            }

            if !dfs(g, i, &visiting, &visited) {
                return false
            }
        }

        return true
    }

    func dfs(_ g: [[Int]], _ c: Int, _ visiting: inout Set<Int>, _ visited: inout Set<Int>) -> Bool {
        if visited.contains(c) {
            return true
        }

        if visiting.contains(c) {
            return false
        }
        visiting.insert(c)

        for p in g[c] {
            if !dfs(g, p, &visiting, &visited) {
                return false
            }
        }

        visiting.remove(c)
        visited.insert(c)

        return true
    }
}
