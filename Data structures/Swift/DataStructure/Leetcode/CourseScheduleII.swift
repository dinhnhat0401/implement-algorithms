//
//  CourseScheduleII.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class CourseScheduleII {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // go throught list of prerequisites to create list of adjacency vertices
        // initialize a finished set to store finished courses
        // initialize a visiting set to store visiting courses
        // initialize a result stack to store result
        // for i from 0 ..< n
            // if course i is not included in finished -> O(1)
                // if dfs(i, visited) is false
                    // return an empty array
        // return result.reversed()

        // func dfs(i, visited) -> Bool
            // MARK i as visiting
            // for each prerequisite course p
                // if course p is included in visiting
                    // return false since cycle is included
                // if course p is finished
                    // CONTINUE since we don't need to care about this couse any more
                    // SHOULDN'T RETURN true here since we still need to handle other prerequisites
                // if dfs(p) is false
                    // return false since cycle is included

            // remove i from visiting to finished
            // push i to result
            // return true

        // TIME COMPLEXITY: O(C + P) with C is number of courses, P is number of prerequisites
        // SPACE COMPLEXITY: O(C)
        var adj = [Int: [Int]]()
        for pre in prerequisites {
            if adj[pre[0]] == nil {
                adj[pre[0]] = [Int]()
            }
            adj[pre[0]]!.append(pre[1])
        }

        var finished = Set<Int>()
        var visiting = Set<Int>()
        var result = [Int]()

        for i in 0 ..< numCourses {
            if !finished.contains(i) {
                if !dfsVisit(i, adj, &visiting, &finished, &result) {
                    return []
                }
            }
        }

        return result
    }

    func dfsVisit(_ i:Int, _ adj:[Int: [Int]], _ visiting: inout Set<Int>, _ finished: inout Set<Int>, _ result: inout [Int]) -> Bool {
        visiting.insert(i)

        for p in adj[i] ?? [] {
            if visiting.contains(p) {
                return false
            }

            if finished.contains(p) {
                continue
            }

            if !dfsVisit(p, adj, &visiting, &finished, &result) {
                return false
            }
        }

        visiting.remove(i)
        finished.insert(i)
        result.append(i)

        return true
    }

    func findOrder2(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        var toVisit: [Bool] = Array(repeating: false, count: numCourses)
        var visited: [Bool] = Array(repeating: false, count: numCourses)

        var result: [Int] = []

        func containCircle(_ index: Int) -> Bool {
            if toVisit[index] {
                return true
            }
            if visited[index] {
                return false
            }
            toVisit[index] = true
            visited[index] = true
            for course in graph[index] {
                if containCircle(course) {
                    return true
                }
            }
            result.append(index)
            toVisit[index] = false
            return false
        }

        for prerequisite in prerequisites {
            graph[prerequisite[0]].append(prerequisite[1])
        }

        for index in 0..<numCourses {
            if visited[index] {
                continue
            }
            if containCircle(index) {
                return []
            }
        }
        // result.reverse()
        return result
    }
}
