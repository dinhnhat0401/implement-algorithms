//
//  FindCityWithSmallestNumberOfNeighbors.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/27.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//
// https://leetcode.com/contest/weekly-contest-173/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/
import Foundation

class FindCityWithSmallestNumberOfNeighbors {
    // TLE for some of last test cases
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        // for each city from 0 ... n - 1
            // use Bellman-Ford to calculate shortest path to other edges
            // check how many cities X can reach with given distanceThreshold
            // maintain a result variable to store result city
            // maintain a minReachable variable to store smallest number of reachable cities
        var result = -1
        var minReachable = Int.max
        for i in 0 ..< n {
            let reachable = BF(n, edges, distanceThreshold, i)
            if reachable == -1 {
                continue
            }
            if reachable <= minReachable {
                result = i
                minReachable = reachable
            }
        }

        return result
    }

    func BF(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int, _ s: Int) -> Int {
        var dist = [Int](repeating: Int.max, count: n)
        dist[s] = 0

        for _ in 1 ..< n {
            for e in edges {
                if dist[e[0]] != Int.max && dist[e[0]] + e[2] < dist[e[1]] {
                    dist[e[1]] = dist[e[0]] + e[2]
                }

                if dist[e[1]] != Int.max && dist[e[1]] + e[2] < dist[e[0]] {
                    dist[e[0]] = dist[e[1]] + e[2]
                }
            }
        }

        for e in edges {
            if dist[e[0]] != Int.max && dist[e[0]] + e[2] < dist[e[1]] {
                return -1
            }

            if dist[e[1]] != Int.max && dist[e[1]] + e[2] < dist[e[0]] {
                return -1
            }
        }

        return dist.filter { $0 <= distanceThreshold }.count - 1
    }

    // Floyd-Warshall
    func findTheCity2(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var dist = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
        for i in 0 ..< n {
            dist[i][i] = 0
        }
        for e in edges {
            dist[e[0]][e[1]] = e[2]
            dist[e[1]][e[0]] = e[2]
        }

        for k in 0 ..< n {
            for i in 0 ..< n {
                for j in 0 ..< n {
                    if dist[i][k] != Int.max && dist[k][j] != Int.max && dist[i][j] > dist[i][k] + dist[k][j] {
                        dist[i][j] = dist[i][k] + dist[k][j]
                    }
                }
            }
        }

        var result = -1
        var m = Int.max
        for i in 0 ..< n {
            let reachable = dist[i].filter({ $0 <= distanceThreshold }).count - 1
            if reachable <= m {
                result = i
                m = reachable
            }
        }

        return result
    }
}
