//
//  ReorderList.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class ReorderList {
    // TLE for some unknown reason!!
    func reorderList(_ head: ListNode?) {
        // split array into two list A1, A2
        // c1 is a pointer to an node in A1
        // c2 is a pointer to tail node in A2
        // c2.next = c1.next, c1.next = c2
        guard head != nil else {
            return
        }

        var fast = head
        var slow = head
        var mid = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        mid = slow

        var current = head
        var stop = false
        while !stop {
            let tail = removeLastNode(from: mid!)
            if tail.val == mid!.val {
                stop = true
            }
            tail.next = current!.next
            current!.next = tail
            current = tail.next
        }
    }

    func removeLastNode(from cur: ListNode?) -> ListNode {
        var pre = cur
        var current = cur
        while current?.next != nil {
            pre = current
            current = current?.next
        }
        pre!.next = nil
        return current!
    }

    func reorderList2(_ head: ListNode?) {
        // split list into two lists head1, head2
        // head2 start from the node after middle node
        // reverse head2 list
        // merge head1 list and head2 list
        guard head != nil else {
            return
        }

        var fast = head
        var slow = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var head1 = head
        var head2 = reverse(slow?.next)
        slow?.next = nil
        while head1 != nil && head2 != nil {
            let tmp = head2!.next
            head2!.next = head1!.next
            head1!.next = head2
            head1 = head2!.next
            head2 = tmp
        }
    }

    func reverse(_ head: ListNode?) -> ListNode? {
        var newHead = head
        while head?.next != nil {
            let tmp = head!.next
            head!.next = tmp?.next
            tmp?.next = newHead
            newHead = tmp
        }

        return newHead
    }
}
