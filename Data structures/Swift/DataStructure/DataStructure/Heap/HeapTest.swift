//
//  HeapTest.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/26.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class HeapTest {
    func test1() {
        let arr = [-999, 1, 3, 9, 5, 4, 0]
        var heap = Heap<Int>(arr, sort: <)
        print(heap.nodes)
        heap.add(-900)
        print(heap.nodes)

        var heap2 = Heap<Int>(sort: <)
        heap2.add(100)
        heap2.add(90)
        heap2.add(119)
        heap2.add(1)
        print(heap2.nodes)
    }
}
