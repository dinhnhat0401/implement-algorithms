//
//  BinaryTreeInorderTraversal.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/04.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

extension TreeNode: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }

    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
}

class BinaryTreeInorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // start from root node by push it to stack
        // while stack is not empty
            // if left child is not null and was not visited
                // push left child to stack
            // else
                // append current node to result
                // pop current node from stack
                // mark current node as visited
                // if right child is not null
                    // push right child to stack

        guard let root = root else {
            return []
        }

        var stack = [TreeNode]()
        var visited = Set<TreeNode>()
        var result = [Int]()

        stack.append(root)
        while stack.count > 0 {
            let top = stack[stack.count - 1]
            if top.left != nil && !visited.contains(top.left!) {
                stack.append(top.left!)
            } else {
                result.append(top.val)
                stack.removeLast()
                visited.insert(top)
                if top.right != nil {
                    stack.append(top.right!)
                }
            }
        }

        return result
    }
}
