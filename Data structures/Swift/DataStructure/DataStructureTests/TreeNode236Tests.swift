//
//  TreeNode236Tests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/31.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
import XCTest
@testable import DataStructure

class TreeNode236Tests: XCTestCase {
    func test1() {
        let root = TreeNode236(3)
        root.left = TreeNode236(5)
        root.right = TreeNode236(1)
        root.left?.left = TreeNode236(6)
        root.left?.right = TreeNode236(2)
        root.left?.right?.left = TreeNode236(7)
        root.left?.right?.right = TreeNode236(4)
        root.right?.left = TreeNode236(0)
        root.right?.right = TreeNode236(8)
        XCTAssertEqual(LC236().lowestCommonAncestor(root, TreeNode236(5), TreeNode236(1)), TreeNode236(3))
    }
}
