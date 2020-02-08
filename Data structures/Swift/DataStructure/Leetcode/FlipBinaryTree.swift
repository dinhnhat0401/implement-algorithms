//
//  FlipBinaryTree.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class FlipBinaryTree {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard root1 != nil && root2 != nil else {
            return root1 == nil && root2 == nil
        }

        guard root1!.val == root2!.val else {
            return false
        }

        return (flipEquiv(root1!.left, root2!.left) && flipEquiv(root1!.right, root2!.right)) ||
        (flipEquiv(root1!.left, root2!.right) && flipEquiv(root1!.right, root2!.left))
    }
}
