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

//    /** Delete a word from the trie. */
//    func delete(_ word: String) -> Bool {
        // start from the empty root as usual
        // while move down the trie via children nodes
            // if any child node is null
                // return false -> the word doesn't exist in current trie
        // if current node has children
            // mark current node not a complete word anymore
        // else
            // we have a big problem to solve
            // we have two options
                // 1: store a parent pointer to go backward form child to parent
                // 2: go from root to current node, put element in a stack
            // from current (node specified by word) go backward to root
                // until we found a node that has >= 2 children
                    // delete the node from parent children
//    }

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
