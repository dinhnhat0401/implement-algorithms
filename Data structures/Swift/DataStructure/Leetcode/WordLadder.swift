//
//  WordLadder.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/19.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class WordLadder {
    static func test() {

    }

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // idea 1
        // fact: beginWord is not belong to wordList
        // fact: wordList contains unique words with same length
        // fact: endWord is belong to wordList
        // build a graph G from word list
            // for each word1 in word list
                // for each other word2 in word list
                    // if word1 and word2 is related, word1 <=> word2 in just 1 edit
                        // add a new undirected edge (word1 - word2) to G
        // start BFS from node(endWord)
            // if we reach a node related to beginWord
            // return current steps

        var g = Graph()

        for i in 0 ..< wordList.count - 1 {
            for j in i + 1 ..< wordList.count {
                if isRelated(wordList[i], wordList[j]) {
                    g.addUndirectedEdge(wordList[i], wordList[j])
                }
            }
        }



        return 0
    }

    func isRelated(_ w1: String, _ w2: String) -> Bool {

    }
}
