//
//  LC218.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LC218 {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        // Use divide and conquer method
        // Base cases
            // buildings.count == 0
                // return empty array
            // building.count == 1
                // return [[x-start, y], [x-end, 0]]
        // Divide buildings to two halfs til we reach base case
            // calculate skyline for each building
            // merge the result

        let N = buildings.count
        if N == 0 {
            return []
        }

        if N == 1 {
            return [[buildings[0][0], buildings[0][2]], [buildings[0][1], 0]]
        }

        let left = getSkyline(Array(buildings[0 ... N/2 - 1]))
        let right = getSkyline(Array(buildings[N/2 ... N - 1]))
        return mergeSkylines(left, right)
    }

    func mergeSkylines(_ left: [[Int]], _ right: [[Int]]) -> [[Int]] {
        // use pL, pR as pointers to current element need to merged
        // currY as current height the buiding, if there is change in currY, it means we need to add current point to output
        var output = [[Int]]()
        var pL = 0
        var pR = 0
        var p1Y = 0
        var p2Y = 0
        var currY = 0
        var x = 0
        while pL < left.count && pR < right.count {
            let p1 = left[pL]
            let p2 = right[pR]
            if p1[0] < p2[0] {
                x = p1[0]
                p1Y = p1[1]
                pL += 1
            } else {
                x = p2[0]
                p2Y = p2[1]
                pR += 1
            }

            let maxY = max(p1Y, p2Y)
            if currY != maxY {
                // okay, height is changed, add this new point to output
                updateOutput(&output, [x, maxY])
                currY = maxY
            }
        }

        // there is only left skyline
        appendSkyline(&output, left, pL, &currY)

        // there is only right skyline
        appendSkyline(&output, right, pR, &currY)

        return output
    }

    func updateOutput(_ output: inout [[Int]], _ point: [Int]) {
        if output.count == 0 || output[output.count - 1][0] != point[0] {
            output.append(point)
        } else {
            output[output.count - 1][1] = point[1]
        }
    }

    func appendSkyline(_ output: inout [[Int]], _ skylines: [[Int]], _ p: Int, _ currY: inout Int) {
        var p = p
        while p < skylines.count {
            let point = skylines[p]
            if currY != point[1] {
                updateOutput(&output, point)
                currY = point[1]
            }
            p += 1
        }
    }
}
