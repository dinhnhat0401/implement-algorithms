//
//  AlienDictionaryTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class AlienDictionaryTests: XCTestCase {
//    func test1 () {
//        XCTAssertEqual(AlienDictionary().alienOrder(["ab", "adc"]), "cabd")
//    }

    func test2 () {
        XCTAssertEqual(AlienDictionary().alienOrder(["wrt","wrf","er","ett","rftt"]), "wertf")
    }
//
//    func test3() {
//        XCTAssertEqual(AlienDictionary().alienOrder(["vlxpwiqbsg","cpwqwqcd"]), "lqwxpgsdbivc")
//    }
}
