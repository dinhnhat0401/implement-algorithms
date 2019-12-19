//
//  LinkedListNode.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2019/12/19.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

fileprivate struct LinkedListNode<T> {
    var data: T
    var next: LinkedListNode<T>?
    var prev: LinkedListNode<T>?

    init(_ data: T) {
        self.data = data
        self.next = nil
        self.prev = nil
    }
}

public struct LinkedList<T> {
    public enum LinkedListError: Error {
        case EmptyLinkedList
    }

    public func append(data: T) {
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

    public func first() -> T throws {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        return head!.data
    }

    public func removeFirst() -> T throws {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        head = head!.next
        if head == nil {
            tail = tail!.next
        }


    }

    public func last() -> T throws {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        return tail!.data
    }

    public func removeLast() -> T throws {
        if isEmpty() {
            throw LinkedListError.EmptyLinkedList
        }

        return tail!.data
    }

    public func isEmpty() -> Bool {
        return head == nil
    }

    // MARK: - private variables

    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
}
