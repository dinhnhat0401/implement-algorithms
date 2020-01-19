//
//  DeleteLeafWithGivenValueTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class DeleteLeafWithGivenValueTests: XCTestCase {
    func test1() {
        let root = TreeNode(1)
        root.left = TreeNode(1)
        root.right = TreeNode(1)
        XCTAssertEqual(DeleteLeafWithGivenValue().removeLeafNodes(root, 1), nil)
    }

    func test2() {
        let root = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left!.left = TreeNode(2)
        root.right!.left = TreeNode(2)
        root.right!.right = TreeNode(4)
        _ = DeleteLeafWithGivenValue().removeLeafNodes(root, 2)
        XCTAssertEqual(root.left, nil)
    }
}
