//
//  InvertBinaryTree.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/24.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class InvertBinaryTree {
    // Time complexity: O(N)
    // Space complexity: O(logN) - height of the tree, worst case O(N) -
    // when each node have only one child, tree became a linked list - for the memory heap to store recursive results
    // Good point: easy to understand/code
    // Improvement: stack overflow
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }

        let tmp = root.left
        root.left = root.right
        root.right = tmp

        invertTree1(root.left)
        invertTree1(root.right)

        return root
    }

    // Time complexity: O(N) - since we need to go through all the nodes
    // Space complexity: O(logN), worst case O(N) for the stack

    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }

        var s = [TreeNode]()
        s.append(root)
        while s.count > 0 {
            guard let n = s.popLast() else {
                continue
            }

            let tmp = n.left
            n.left = n.right
            n.right = tmp

            if let l = n.left {
                s.append(l)
            }

            if let r = n.right {
                s.append(r)
            }
        }

        return root
    }
}
