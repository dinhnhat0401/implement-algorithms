//
//  TreeNode.swift
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
