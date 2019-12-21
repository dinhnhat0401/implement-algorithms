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

    func ladderLength2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Idea 2
        // 1. do the pre-processing on the given wordList and find all the possible generic/intermediate states. save these intermediate states in a dictionary with key as the intermediate word and value as the list of words which have the same intermediate word.
        // 2. BFS start with frontier = [beginWord] til reach endWord
        // 3. To prevent cycles, use a visited set

        if wordList.count == 0 {
            return 0
        }

        let L = wordList[0].count
        var states = [String: [String]]()
        for word in wordList {
            let startIndex = word.startIndex
            for i in 0 ..< L {
                let ith = word.index(startIndex, offsetBy: i)
                let afterith = word.index(after: ith)
                let genericState = String(word[startIndex..<ith] + "*" + word[afterith...])
                if states[genericState] == nil {
                    states[genericState] = [String]()
                }
                states[genericState]!.append(word)
            }
        }

        var frontier = [beginWord]
        var layer = 1
        var visited = Set<String>()

        while frontier.count > 0 {
            var next = [String]()
            for currentWord in frontier {
                for i in 0 ..< L {
                    let startIndex = currentWord.startIndex
                    let ith = currentWord.index(startIndex, offsetBy: i)
                    let afterith = currentWord.index(after: ith)
                    let genericState = String(currentWord[startIndex..<ith] + "*" + currentWord[afterith...])
                    if !visited.contains(genericState) {
                        visited.insert(genericState)
                        if let currentState = states[genericState] {
                            if currentState.contains(endWord) {
                                return layer + 1
                            }

                            next.append(contentsOf: currentState)
                        }
                    }
                }
            }

            frontier = next
            layer += 1
        }

        return 0
    }

    func ladderLength3(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Idea 2
        // 1. do the pre-processing on the given wordList and find all the possible generic/intermediate states. save these intermediate states in a dictionary with key as the intermediate word and value as the list of words which have the same intermediate word.
        // 2. BFS start with frontier = [beginWord] til reach endWord
        // 3. To prevent cycles, use a visited set
        // 4. Use BI-directional BFS to reduce search space

        if wordList.count == 0 {
            return 0
        }

        if !wordList.contains(endWord) {
            return 0
        }

        let L = wordList[0].count
        var states = [String: Set<String>]()
        for word in wordList {
            let startIndex = word.startIndex
            for i in 0 ..< L {
                let ith = word.index(startIndex, offsetBy: i)
                let afterith = word.index(after: ith)
                let genericState = String(word[startIndex..<ith] + "*" + word[afterith...])
                if states[genericState] == nil {
                    states[genericState] = Set<String>()
                }
                states[genericState]!.insert(word)
            }
        }

        var frontier1:Set<String> = [beginWord]
        var frontier2:Set<String> = [endWord]
        var layer1 = 1
        var layer2 = 1
        var visited1 = Set<String>()
        var visited2 = Set<String>()

        while frontier1.count > 0 && frontier2.count > 0 {
            var next1 = getNext(frontier1, &visited1, states)
            if !next1.isDisjoint(with: frontier2) {
                return layer1 + layer2
            }
            var next2 = getNext(frontier2, &visited2, states)
            if !next2.isDisjoint(with: next1) {
                return layer1 + layer2 + 1
            }

            frontier1 = next1
            frontier2 = next2
            layer1 += 1
            layer2 += 1
        }

        return 0
    }

    func getNext(_ frontier: Set<String>, _ visited: inout Set<String>, _ states: [String: Set<String>]) -> Set<String> {
        var next = Set<String>()
        for currentWord in frontier {
            for i in 0 ..< currentWord.count {
                let startIndex = currentWord.startIndex
                let ith = currentWord.index(startIndex, offsetBy: i)
                let afterith = currentWord.index(after: ith)
                let genericState = String(currentWord[startIndex..<ith] + "*" + currentWord[afterith...])
                if !visited.contains(genericState) {
                    visited.insert(genericState)
                    if let currentState = states[genericState] {
                        next = next.union(currentState)
                    }
                }
            }
        }

        return next
    }
}
