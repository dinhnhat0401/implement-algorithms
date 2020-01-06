//
//  Trie.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/01/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class Trie {

    /** Initialize your data structure here. */
    init() {
        // init a root node
        root = TrieNode()
    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var cur = root
        var i = word.startIndex
        while i != word.endIndex {
            if cur.children[word[i]] == nil {
                cur.children[word[i]] = TrieNode()
            }
            cur = cur.children[word[i]]!
            i = word.index(after: i)
        }
        cur.isCompleteWord = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var cur = root
        var i = word.startIndex
        while i != word.endIndex {
            guard let child = cur.children[word[i]] else {
                return false
            }
            cur = child
            i = word.index(after: i)
        }
        return cur.isCompleteWord
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        var i = prefix.startIndex
        while i != prefix.endIndex {
            guard let child = cur.children[prefix[i]] else {
                return false
            }
            cur = child
            i = prefix.index(after: i)
        }

        return true
    }

    private var root: TrieNode
}

private class TrieNode {
    var children = [Character: TrieNode]()
    var isCompleteWord: Bool = false
}


/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
