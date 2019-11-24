
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: Comparable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }

    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }

    public static func > (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val > rhs.val
    }
}

class Solution {
    func test() {
        var lists = [ListNode?]()
        let list1 = ListNode(1)
        list1.next = ListNode(4)
        list1.next?.next = ListNode(5)
        lists.append(list1)

        let list2 = ListNode(1)
        list2.next = ListNode(3)
        list2.next?.next = ListNode(4)
        lists.append(list2)

        let list3 = ListNode(2)
        list3.next = ListNode(6)
        lists.append(list3)

        mergeKLists(lists)
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var head: ListNode?
        var current: ListNode?
        var heap = Heap<ListNode>(sort: <)
        for list in lists {
            if let list = list {
                heap.add(e: list)
            }
        }

        while heap.heapSize > 0 {
            let e = heap.extract()
            if let next = e.next {
                heap.add(e: next)
            }
            if head == nil {
                head = e
                current = e
            } else {
                current?.next = e
                current = current?.next
            }
        }

        return head
    }
}
