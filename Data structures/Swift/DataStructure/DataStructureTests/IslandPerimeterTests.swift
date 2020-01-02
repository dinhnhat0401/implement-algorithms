//
//  IslandPerimeterTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class IslandPerimeterTests: XCTestCase {
    func test1() {
        IslandPerimeter().islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])
    }
}
