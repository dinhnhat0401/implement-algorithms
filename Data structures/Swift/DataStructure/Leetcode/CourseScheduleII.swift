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
        // initizalie a finished set to contain finished course
        // for i from 0 ..< n
            // initialize a visited set, contains visited course
            // if course i is not finished
                // push dfs(i, visited) to finished list

        // func dfs(i, visited)
            // for each prerequisite course p
                // if course p is not finished and is not visited
                    // mark p as visited
                    // try to dfs(p)
            // return i
        var adj = [Int: [Int]]()
        for pre in prerequisites {
            if adj[pre[0]] == nil {
                adj[pre[0]] = [Int]()
            }
            adj[pre[0]]!.append(pre[1])
        }

        var finished = [Int]()
        var courses = Set<Int>()
        for i in 0 ..< numCourses {
            courses.insert(i)
        }
        while courses.count > 0 {
            let i = courses.first!
            var visited = Set<Int>()
            if !finished.contains(i) {
                let nextCourse = dfsVisit(i, adj, &visited, courses)
                guard nextCourse != -1 else {
                    return []
                }
                finished.append(nextCourse)
                courses.remove(nextCourse)
            }
        }

        return finished
    }

    func dfsVisit(_ i:Int, _ adj:[Int: [Int]], _ visited: inout Set<Int>, _ courses: Set<Int>) -> Int {
        for p in adj[i] ?? [] {
            if visited.contains(p) {
                return -1
            }

            if !visited.contains(p) && courses.contains(p) {
                visited.insert(p)
                return dfsVisit(p, adj, &visited, courses)
            }
        }

        return i
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
