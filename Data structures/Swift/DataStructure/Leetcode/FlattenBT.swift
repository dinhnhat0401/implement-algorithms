//
//  FlattenBT.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/05/17.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

public class TreeNode114 {
    public var val: Int
    public var left: TreeNode114?
    public var right: TreeNode114?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode114?, _ right: TreeNode114?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class FlattenBT {
    func flatten(_ root: TreeNode114?) {
        guard let root = root else {
            return
        }

        _ = helper(root)
    }

    func helper(_ n: TreeNode114) -> TreeNode114 {
        // print(n.val)

        if isLeaf(n) {
            return n
        }

        let l = n.left
        let r = n.right
        var cur = n

        if let l = l {
            n.right = helper(l)
            n.left = nil
            while cur.right != nil {
                cur = cur.right!
                print(cur.val)
            }
        }

        if let r = r {
            cur.right = helper(r)
        }
        return n
    }

    func isLeaf(_ n: TreeNode114) -> Bool {
        return n.left == nil && n.right == nil
    }
}
