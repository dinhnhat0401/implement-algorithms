//
//  LRUCache.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LRUCache {

    init(_ capacity: Int) {
        self.capacity = capacity
        self.count = 0
        self.map = [Int: LRUCacheNode]()
    }

    func get(_ key: Int) -> Int {
        guard let n = map[key] else {
            return -1
        }

        remove(n)
        add(n)
        return n.val
    }

    func put(_ key: Int, _ value: Int) {
        guard map[key] == nil else {
            // need to move node to head of the linkedlist and update the value
            let n = map[key]!
            n.val = value
            remove(n)
            add(n)
            return
        }

        let newNode = LRUCacheNode(key, value)
        add(newNode)
        if self.count > capacity {
            // remove LRU element
            remove(tail!)
        }
    }

    private func add(_ n: LRUCacheNode) {
        map[n.key] = n

        n.next = head
        head?.prev = n
        head = n

        count += 1

        if count == 1 {
            tail = head
        }
    }

    private func remove(_ n: LRUCacheNode) {
        map[n.key] = nil
        count -= 1

        if n == head { // remove head
            head?.next?.prev = head?.prev
            head = head?.next
            return
        }

        if n == tail { // remove tail
            tail?.prev?.next = tail?.next
            tail = tail?.prev
            return
        }

        // remove a middle node
        n.next?.prev = n.prev
        n.prev?.next = n.next
    }

    var count: Int
    var capacity: Int
    var head: LRUCacheNode?
    var tail: LRUCacheNode?
    var map: [Int: LRUCacheNode]
}

class LRUCacheNode: Equatable {
    var val: Int
    var key: Int
    var next: LRUCacheNode?
    var prev: LRUCacheNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }

    static func ==(lhs: LRUCacheNode, rhs: LRUCacheNode) -> Bool {
        return lhs.val == rhs.val && lhs.key == rhs.key
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
