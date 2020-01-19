//
//  DeleteLeafWithGivenValue.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class DeleteLeafWithGivenValue {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        // if root is a leaf
            // if its value is target
            // remove by assign it to nil
        // recursively call remove while removed != 0 means we didn't removed any nodes in last move
        var removed = 0
        var root = root
        repeat {
            removed = 0
            dfs(&root, target, &removed)
        } while removed != 0

        return root
    }

    func dfs(_ n: inout TreeNode?, _ target: Int, _ removed: inout Int) {
        guard n != nil else {
            return
        }

        if n!.left == nil && n!.right == nil && n!.val == target {
            removed += 1
            n = nil
            return
        }

        dfs(&n!.left, target, &removed)
        dfs(&n!.right, target, &removed)
    }
}
