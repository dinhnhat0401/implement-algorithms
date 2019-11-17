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

        areSentencesSimilarTwo(["an","excellent","lunch"], ["one","good","dinner"], [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]])
    }

    func areSentencesSimilarTwo(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count {
            return false
        }

        // build graph
        let g = Graph<String>()
        for pair in pairs {
            g.addUndirectedEdge(pair[0], pair[1])
        }

        for (index, word) in words1.enumerated() {
            if words2[index] == word || g.bfs(words2[index], word) {
                continue
            }

            return false
        }

        return true
    }
}

