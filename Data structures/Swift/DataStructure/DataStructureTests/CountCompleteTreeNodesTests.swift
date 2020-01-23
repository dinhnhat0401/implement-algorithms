//
//  CountCompleteTreeNodesTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class CountCompleteTreeNodesTests: XCTestCase {
    func test1() {
        let root = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left!.left = TreeNode(4)
        root.left!.right = TreeNode(5)
        root.right!.left = TreeNode(6)
        XCTAssertEqual(CountCompleteTreeNodes().countNodes2(root), 6)
    }
}
