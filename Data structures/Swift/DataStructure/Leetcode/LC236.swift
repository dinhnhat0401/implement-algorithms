//
//  LC236.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/31.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode236 {
    public var val: Int
    public var left: TreeNode236?
    public var right: TreeNode236?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode236: Hashable, Equatable {
    public static func ==(lhs: TreeNode236, rhs: TreeNode236) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}

class LC236 {
    func lowestCommonAncestor(_ root: TreeNode236?, _ p: TreeNode236?, _ q: TreeNode236?) -> TreeNode236? {
        guard let root = root else {
            return nil
        }

        var parent = [TreeNode236: TreeNode236]()
        var frontier = [root]
        while frontier.count > 0 {
            var next = [TreeNode236]()
            for n in frontier {
                if let l = n.left {
                    parent[l] = n
                    next.append(l)
                }
                if let r = n.right {
                    parent[r] = n
                    next.append(r)
                }
            }
            frontier = next
        }
        var cur = p
        var visited = Set<TreeNode236>()
        while cur != nil {
            visited.insert(cur!)
            cur = parent[cur!]
        }
        cur = q
        while cur != nil {
            if visited.contains(cur!) {
                return cur
            }
            cur = parent[cur!]
        }

        return nil
    }
}
