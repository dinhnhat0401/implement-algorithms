//
//  ShortestDistance.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class ShortestDistance {
    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        // idea try to dfs from start position
        // How to calculate minimum length of path, use a sum[[Int]: Int] dictionary
        // How to determine if the ball  is stopped?
            // currentPosition + direction is out of bound or maze[newPos] == 1
        // How to know when to stop DFS?
            // when we reach a cell that we visited before with longer path as in sum dictionary
        // TIME COMPLEXITY: ?
        // SPACE COMPLEXITY: ?
        // what is the best time complexity we can think of ?
        M = maze.count
        N = maze[0].count
        var sum = [Int](repeating: -1, count: M * N)
        let startIndex = start[0] * N + start[1]
        sum[startIndex] = 0
        dfs(maze, start, &sum)
        return sum[destination[0] * N + destination[1]]
    }

    func dfs(_ maze: [[Int]], _ current: [Int], _ sum: inout [Int]) {
        let currentIndex = current[0] * N + current[1]
        for d in directions {
            var newPos = current
            var checker = [current[0] + d[0], current[1] + d[1]]
            var step = 0
            while checker[0] >= 0 &&
                checker[0] < M &&
                checker[1] >= 0 &&
                checker[1] < N &&
                maze[checker[0]][checker[1]] != 1 {
                    step += 1
                    newPos = checker
                    checker = [checker[0] + d[0], checker[1] + d[1]]
            }

            let newPosIndex = newPos[0] * N + newPos[1]
            if step == 0 || (sum[newPosIndex] != -1 && sum[newPosIndex] <= sum[currentIndex] + step) {
                continue
            }

            sum[newPosIndex] = sum[currentIndex] + step
            dfs(maze, newPos, &sum)
        }
    }

    func shortestDistance2(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        // idea try to dfs from start position
        // How to calculate minimum length of path, use a sum[[Int]: Int] dictionary
        // How to determine if the ball  is stopped?
            // currentPosition + direction is out of bound or maze[newPos] == 1
        // How to know when to stop DFS?
            // when we reach a cell that we visited before with longer path as in sum dictionary
        // TIME COMPLEXITY: ?
        // SPACE COMPLEXITY: ?
        // what is the best time complexity we can think of ?
        M = maze.count
        N = maze[0].count
        var sum = [Int](repeating: -1, count: M * N)
        let startIndex = start[0] * N + start[1]
        sum[startIndex] = 0
        // dfs(maze, start, &sum)
        var q = Queue()
        q.append(start)
        while q.count > 0 {
            let current = q.removeFirst()
            let currentIndex = current[0] * N + current[1]
            for d in directions {
                var newPos = current
                var checker = [current[0] + d[0], current[1] + d[1]]
                var step = 0
                while checker[0] >= 0 &&
                    checker[0] < M &&
                    checker[1] >= 0 &&
                    checker[1] < N &&
                    maze[checker[0]][checker[1]] != 1 {
                        step += 1
                        newPos = checker
                        checker = [checker[0] + d[0], checker[1] + d[1]]
                }

                let newPosIndex = newPos[0] * N + newPos[1]
                if step == 0 || (sum[newPosIndex] != -1 && sum[newPosIndex] <= sum[currentIndex] + step) {
                    continue
                }

                sum[newPosIndex] = sum[currentIndex] + step
                q.append(newPos)
            }
        }

        return sum[destination[0] * N + destination[1]]
    }

    var M = 0
    var N = 0
    let directions = [[-1, 0], [0, -1], [0, 1], [1, 0]]
}

private class Node {
    var val: [Int]
    var next: Node?
    init(_ val: [Int]) {
        self.val = val
    }
}

private struct Queue {
    mutating func append(_ val: [Int]) {
        if head == nil {
            head = Node(val)
            tail = head
        } else {
            tail!.next = Node(val)
            tail = tail!.next
        }

        count += 1
    }

    mutating func removeFirst() -> [Int] {
        let val = head!.val
        head = head!.next
        count -= 1
        return val
    }

    var tail: Node?
    var head: Node?
    var count = 0
}
