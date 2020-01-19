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
        // TIME COMPLEXITY: O(m * n * max(m, n))
        // SPACE COMPLEXITY: O(m * n)
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
        // TIME COMPLEXITY: O(m * n * max(m, n))
        // SPACE COMPLEXITY: O(m * n)
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

    func shortestDistance3(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        // try to dijkstra from start
        // use sum array to keep track of shortest path from start to maze[i][j]
        // TIME COMPLEXITY: O(m * n * log(m * n)) in worst case we need to enque every node exactly one time, log(mn) is for extract-min method
        // SPACE COMPLEXITY: O(m * n) for the sum array
        // what is the best time complexity we can think of ?
        M = maze.count
        N = maze[0].count
        var sum = [Int](repeating: -1, count: M * N)
        let startIndex = start[0] * N + start[1]
        sum[startIndex] = 0
        dijkstra(maze, start, &sum)
        return sum[destination[0] * N + destination[1]]
    }

    func dijkstra(_ maze: [[Int]], _ start: [Int], _ sum: inout [Int]) {
        var q = PriorityQueue(10)
        q.add([start[0], start[1], 0])
        while q.size > 0 {
            // current <- q.extract-min()
            // try to relax all edges come out from current
            // for d in directions
                // find next stop newPos
                // if we did move and can relax
                    // relax(current, newPos, 1)
                    // q.add(newPos)
            let current = q.extractMin()
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
                relax(currentIndex, newPosIndex, step, &sum)
                q.add([newPos[0], newPos[1], sum[newPosIndex]])
            }
        }
    }

    func relax(_ u: Int, _ v: Int, _ w: Int, _ sum: inout [Int]){
        if sum[v] == -1 || sum[v] > sum[u] + w {
            sum[v] = sum[u] + w
        }
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

public struct PriorityQueue { // need a min heap
    public private(set) var size = 0
    var arr: [[Int]]
    var limit: Int

    init(_ limit: Int) {
        self.limit = limit
        self.arr = [[Int]](repeating: [], count: limit)
    }

    func left(_ i: Int) -> Int {
        return 2 * i + 1
    }

    func right(_ i: Int) -> Int {
        return 2 * i + 2
    }

    func parent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    mutating func add(_ val: [Int]) {
        if size == limit {
            // growth limit size to be able to add more element
            limit *= 2
            for _ in 0 ..< limit {
                self.arr.append([])
            }
        }

        arr[size] = val
        size += 1
        shiftUp(size - 1)
    }

    mutating func extractMin() -> [Int] {
        let result = arr[0]
        arr.swapAt(0, size - 1)
        size -= 1
        shiftDown(0)
        return result
    }

    mutating func shiftUp(_ i: Int) {
        var i = i
        while arr[i][2] < arr[parent(i)][2] {
            arr.swapAt(i, parent(i))
            i = parent(i)
        }
    }

    mutating func shiftDown(_ i: Int) {
        var i = i
        while i < size {
            var swapChild = i
            let l = left(i)
            let r = right(i)
            if l < size && arr[i][2] > arr[l][2] {
                swapChild = l
            }
            if r < size && arr[l][2] > arr[r][2] {
                swapChild = r
            }

            if i == swapChild {
                break
            }

            arr.swapAt(i, swapChild)
            i = swapChild
        }
    }
}
