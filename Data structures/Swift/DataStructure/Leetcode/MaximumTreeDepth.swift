//
//  MaximumTreeDepth.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/24.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class MaximumTreeDepth {
    // recursive solution
    // Since we need to visit each node only once, the time complexity is O(N)
    // Space complexity: O(logN) average - the tree is balanced
    // Worst case space complexity O(N) where the tree is extremely un-balanced - all nodes only have right child
    // What is good: simple implementation
    // What can be improved:
    // 1. use tail-recursion to avoid stack overflow
    // 2. Mimic the stack call process by using 2 stacks: 1 for storing nodes, other for depth try to simultaneously push/pop element from stack
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
