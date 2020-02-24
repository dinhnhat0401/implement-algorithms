//
//  MinStack.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/24.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class MinStack {

    /** initialize your data structure here. */
    init() {
        nodes = [MSNode]()
        count = 0
    }

    func push(_ x: Int) {
        nodes.append(MSNode(x, min(x, getMin())))
        count += 1
    }

    func pop() {
        guard count > 0 else {
            return
        }

        nodes.removeLast()
        count -= 1
    }

    func top() -> Int {
        guard count > 0 else {
            return Int.max
        }

        return nodes.last!.val
    }

    func getMin() -> Int {
        guard count > 0 else {
            return Int.max
        }

        return nodes.last!.curMin
    }

    private var nodes: [MSNode]
    private var count: Int

    class MSNode {
        var val: Int
        var curMin: Int

        init(_ val: Int, _ curMin: Int) {
            self.val = val
            self.curMin = curMin
        }
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
