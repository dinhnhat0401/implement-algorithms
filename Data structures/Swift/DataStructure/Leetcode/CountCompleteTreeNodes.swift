//
//  CountCompleteTreeNodes.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class CountCompleteTreeNodes {
    // O(N)
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        return 1 + countNodes(root!.left) + countNodes(root!.right)
    }

    func countNodes2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        // calculate the height of the tree
        var h = 0
        var current = root
        while current?.left != nil {
            current = current?.left
            h += 1
        }

        var l = 1
        var r = Int(pow(Double(2), Double(h))) - 1
        while l <= r {
            let m = l + (r - l)/2
            if exist(root, h, m) {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return l + Int(pow(Double(2), Double(h))) - 1
    }

    func exist(_ root: TreeNode?, _ h: Int, _ idx: Int) -> Bool {
        var current = root
        var l = 0
        var r = Int(pow(Double(2), Double(h))) - 1
        for _ in 0 ..< h {
            let m = l + (r - l)/2
            if idx > m {
                l = m + 1
                current = current?.right
            } else {
                r = m
                current = current?.left
            }
        }

        return current != nil
    }
}
