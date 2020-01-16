//
//  LinkedListNode.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2020/01/16.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//
//    func makeIterator() -> Iterator
//}
//
//protocol IteratorProtocol {
//    associatedtype Element
//
//    mutating func next() -> Element?
//}

class LinkedListNode1<T> {
    var next: LinkedListNode1?
    var val: T

    init(_ val: T) {
        self.val = val
    }
}

// Sequence: a type that provide sequential, iterated access to its elements
class LinkedListSequence<T>: Sequence, IteratorProtocol {
    typealias Element = LinkedListNode1<T>

    func next() -> Element? {
        let tmp = current
        current = current?.next
        return tmp
    }

    func makeIterator() -> Iterator {
        current = head
        return self
    }

    func append(_ val: T) {
        let newNode = LinkedListNode1<T>(val)
        if head == nil {
            head = newNode
            current = newNode
        } else {
            current?.next = newNode
            current = current?.next
        }
    }

    private var current: Element?
    private var head: Element?
}
