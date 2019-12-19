//
//  LinkedListNode.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/19.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

fileprivate class LinkedListNode<T> {
    var data: T
    var next: LinkedListNode<T>?
    var prev: LinkedListNode<T>?

    init(_ data: T) {
        self.data = data
        self.next = nil
        self.prev = nil
    }
}

public enum LinkedListError: Error {
    case EmptyLinkedList
}

public struct LinkedList<T> {
    public mutating func append(data: T) {
        let newNode = LinkedListNode(data)
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            tail!.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }

    public func first() throws -> T {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        return head!.data
    }

    public mutating func removeFirst() throws -> T {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        let val = head!.data
        head = head!.next
        if head == nil {
            tail = nil
        }

        return val
    }

    public func last() throws -> T {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        return tail!.data
    }

    public mutating func removeLast() throws -> T {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        let val = tail!.data
        tail!.prev?.next = tail!.next
        tail = tail?.next

        if tail == nil {
            head = nil
        }
        return val
    }

    public func isEmpty() -> Bool {
        return head == nil
    }

    // MARK: - private variables

    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
}
