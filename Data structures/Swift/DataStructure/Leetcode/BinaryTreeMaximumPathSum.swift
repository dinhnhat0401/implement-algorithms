//
//  BinaryTreeMaximumPathSum.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class BinaryTreeMaximumPathSum {
    var result = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root)
        return result
    }

    // the idea is use a func called maxGain,
    // left_gain = max(maxGain(n.left), 0)
    // right_gain = max(maxGain(n.right), 0)
    // maxGain(n) = n.val + max(left_gain, right_gain)
    // newPathSum = n.val + left_gain + right_gain
    // if newPathSum > currentMaxPathSum => update currentMaxPathSum's value
    func maxGain(_ n: TreeNode?) -> Int {
        if n == nil {
            return 0
        }

        let leftGain = max(maxGain(n!.left), 0)
        let rightGain = max(maxGain(n!.right), 0)

        let newPathSum = n!.val + leftGain + rightGain
        result = max(result, newPathSum)

        return n!.val + max(leftGain, rightGain)
    }
}
