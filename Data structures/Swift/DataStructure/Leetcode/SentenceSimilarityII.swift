//
//  SentenceSimilarityII.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/17.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//
// https://leetcode.com/problems/sentence-similarity-ii/

class SentenceSimilarityII {
    // use graph
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

    // use union-find
    func areSentencesSimilarTwo2(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count {
            return false
        }

        let uf = UnionFind<String>()
        for pair in pairs {
            uf.union(uf.makeSet(pair[0]), uf.makeSet(pair[1]))
        }

        for (index, word) in words1.enumerated() {
            if words2[index] == word || uf.findSet(uf.makeSet(words2[index])) == uf.findSet(uf.makeSet(word)) {
                continue
            }

            return false
        }

        return true
    }
}
