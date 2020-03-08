//
//  SentenceSimilarityIITests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/07.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class SentenceSimilarityIITests: XCTestCase {
    func test1() {
        XCTAssertEqual(SentenceSimilarityII().areSentencesSimilarTwo(["an","extraordinary","meal","meal"],
        ["one","good","dinner"],
        [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]), true)
    }
}

