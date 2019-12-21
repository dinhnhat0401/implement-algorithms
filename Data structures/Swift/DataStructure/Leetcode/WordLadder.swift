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
            // for each word in word list
                // for each node in G.nodes
                    // if word and node.data is related, word <=> node.data in just 1 edit
                        // add new node with data as word
                        // add newNode as an adjacency node of node and vice versa
        // start BFS from node(endWord)
            // if we reach a node related to beginWord
            // return current steps

        var g = Graph<String>()
        for i in 0 ..< wordList.count - 1 {
            for j in i + 1 ..< wordList.count {
                if isRelated(wordList[i], wordList[j]) {
                    g.addUndirectedEdge(wordList[i], wordList[j])
                }
            }
        }

        guard let end = g.getNode(endWord) else {
            return 0
        }

        var frontier = [end]
        var visited = Set<Node<String>>()
        var layer = 1

        while frontier.count > 0 {
            var next = [Node<String>]()
            for n in frontier {
                if isRelated(n.data, beginWord) {
                    return layer + 1
                }
                for adj in n.adj {
                    if !visited.contains(adj) {
                        next.append(adj)
                        visited.insert(adj)
                    }
                }
            }

            layer += 1
            frontier = next
        }

        return 0
    }

    func isRelated(_ w1: String, _ w2: String) -> Bool {
        var s1 = w1.startIndex
        var s2 = w2.startIndex
        var count = 0
        while s1 != w1.endIndex {
            if w1[s1] != w2[s2] {
                count += 1
            }
            s1 = w1.index(after: s1)
            s2 = w2.index(after: s2)
        }

        return count == 1
    }
}
