//
//  SentenceSimilarityII.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/17.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//
// https://leetcode.com/problems/sentence-similarity-ii/

class SentenceSimilarityII {
    func areSentencesSimilarTwo(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        let P = pairs.count
        var uf = UnionFind0317(P * 2)
        for p in pairs {
            uf.make(p[0])
            uf.make(p[1])
            uf.union(p[0], p[1])
        }

        for (i, w) in words1.enumerated() {
            if w != words2[i] && uf.find(w) == -1 || uf.find(w) != uf.find(words2[i]) {
                return false
            }
        }

        return true
    }
}

struct UnionFind0317 {
    init(_ size: Int) {
        p = [Int](repeating: -1, count: size)
        rank = [Int](repeating: -1, count: size)
        values = [String: Int]()
    }

    mutating func make(_ w: String) {
        var idx = values[w, default: -1]
        guard idx == -1 else {
            return
        }

        idx = values.count
        values[w] = idx
        p[idx] = idx
        rank[idx] = 1
    }

    mutating func find(_ w: String) -> Int {
        var i = values[w, default: -1]
        guard i != -1 else {
            return -1
        }

        var j = i
        while p[j] != j {
            j = p[j]
        }
        while i != p[i] {
            p[i] = j
            i = p[i]
        }

        return j
    }

    mutating func union(_ w1: String, _ w2: String) {
        let x = find(w1)
        let y = find(w2)
        guard x != y else {
            return
        }
        link(x, y)
    }

    mutating func link(_ x: Int, _ y: Int) {
        if rank[x] >= rank[y] {
            p[y] = x
            if rank[x] == rank[y] {
                rank[x] += 1
            }
        } else {
            p[x] = y
        }
    }

    private var p: [Int]
    private var rank: [Int]
    private var values: [String: Int]
}

//class SentenceSimilarityII {
//    // use graph
//    func areSentencesSimilarTwo(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
//        if words1.count != words2.count {
//            return false
//        }
//
//        // build graph
//        var g = Graph<String>()
//        for pair in pairs {
//            g.addUndirectedEdge(pair[0], pair[1])
//        }
//
//        for (index, word) in words1.enumerated() {
//            if words2[index] == word || g.bfs(words2[index], word) {
//                continue
//            }
//
//            return false
//        }
//
//        return true
//    }
//
//    // use union-find
//    func areSentencesSimilarTwo2(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
//        if words1.count != words2.count {
//            return false
//        }
//
//        let uf = UnionFind<String>()
//        for pair in pairs {
//            uf.union(uf.makeSet(pair[0]), uf.makeSet(pair[1]))
//        }
//
//        for (index, word) in words1.enumerated() {
//            if words2[index] == word || uf.findSet(uf.makeSet(words2[index])) == uf.findSet(uf.makeSet(word)) {
//                continue
//            }
//
//            return false
//        }
//
//        return true
//    }
//
//    func test() {
//        SentenceSimilarityII().areSentencesSimilarTwo2(["an","excellent","lunch"], ["one","good","dinner"], [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]])
//    }
//}
