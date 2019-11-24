//
//  ViewController.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/16.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        SentenceSimilarityII().areSentencesSimilarTwo2(["an","excellent","lunch"], ["one","good","dinner"], [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]])

        var arr = [-999, 1, 3, 9, 5, 4, 0]
        var heap = Heap<Int>(arr, sort: <)
        print(heap.nodes)
        heap.add(e: -900)
        print(heap.nodes)

        var heap2 = Heap<Int>(sort: <)
        heap2.add(e: 100)
        heap2.add(e: 90)
        heap2.add(e: 119)
        heap2.add(e: 1)
        print(heap2.nodes)

        Solution().test()
    }
}
