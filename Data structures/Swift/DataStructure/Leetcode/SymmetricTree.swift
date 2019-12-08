// https://leetcode.com/problems/symmetric-tree/submissions/
//
//  SymmetricTree.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/08.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class SymmetricTree {
    static func test() {
        let root = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(2)
        root.left!.left = TreeNode(2)
        root.right!.left = TreeNode(2)
        print("isSymmetric \(SymmetricTree().isSymmetric(root))")
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetric(root?.left, root?.right)
    }

    func isSymmetric(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        guard t1 != nil, t2 != nil else {
            return t1 == nil && t2 == nil
        }

        if t1!.val != t2!.val {
            return false
        }

        return isSymmetric(t1!.left, t2!.right) && isSymmetric(t1!.right, t2!.left)
    }
}
