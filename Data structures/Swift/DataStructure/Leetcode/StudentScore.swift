//
//  StudentScore.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/27.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class StudentScore {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        // initialize a dictionary D with key - student's id, value - a min heap
        // for each item in items
            // if student's id is exist
                // insert score to min hep
                // continue
            // create a new min heap, insert it to dictionary
        // loop through D's values, call average function on each min heap to get average value for each student and insert it to result array
        // TIME COMPLEXITY: O(N) since we need to loop through N items,each time, we might have to insert and extract-min which cost log(5) => can be considered constant.
        // SPACE COMPLEXITY: O(N) to store dictionary and store result
        var D = [Int: PriorityQueue]()
        for item in items {
            if D[item[0]] == nil {
                D[item[0]] = PriorityQueue()
            }
            D[item[0]]!.insert(item[1])
        }

        var result = [[Int]]()
        for (k, q) in D.sorted(by: { $0.key < $1.key }) {
            result.append([k, q.average()])
        }

        return result
    }
}

public struct PriorityQueue { // need a min heap
    private var limit = 5
    public private(set) var size = 0
    var arr = [Int](repeating: -1, count: 5)

    func left(_ i: Int) -> Int {
        return 2 * i + 1
    }

    func right(_ i: Int) -> Int {
        return 2 * i + 2
    }

    func parent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    mutating func insert(_ val: Int) {
        if size == limit {
            guard val > arr[0] else {
                return
            }

            extractMin()
        }

        arr[size] = val
        size += 1
        shiftUp(size - 1)
    }
	
    mutating func extractMin() {
        arr.swapAt(0, size - 1)
        size -= 1
        shiftDown(0)
    }

    mutating func shiftUp(_ i: Int) {
        var i = i
        while arr[i] < arr[parent(i)] {
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
            if l < size && arr[i] > arr[l] {
                swapChild = l
            }
            if r < size && arr[l] > arr[r] {
                swapChild = r
            }

            if i == swapChild {
                break
            }

            arr.swapAt(i, swapChild)
            i = swapChild
        }
    }

    func average() -> Int {
        var sum = 0
        for i in 0 ..< size {
            sum += arr[i]
        }

        return sum / size
    }
}
