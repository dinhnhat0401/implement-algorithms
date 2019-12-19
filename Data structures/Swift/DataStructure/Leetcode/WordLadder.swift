//
//  WordLadder.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/19.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class WordLadder {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // idea 1
        // fact: beginWord is not belong to wordList
        // fact: wordList contains unique words with same length
        // fact: endWord is belong to wordList
        // build a graph G from word list
            // for each word in word list
                // for each node in G.nodes
                    // if word and node.data is related, word <=> node.data in just 1 edit
                        // add new node with data as word
                        // add newNode as an adjacency node of node and vice versa
        // start BFS from node(endWord)
            // if we reach a node related to beginWord
            // return current steps
        return 0
    }
}
