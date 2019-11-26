import Foundation

struct Heap<T> where T: Comparable {

    init(_ nodes: [T] = [], sort: @escaping (T, T) -> Bool) {
        self.nodes = nodes
        self.heapSize = nodes.count
        self.sort = sort
        buildHeap()
    }

    func peek() -> T {
        return nodes[0]
    }

    mutating func extract() -> T {
        nodes.swapAt(0, heapSize - 1)
        heapSize -= 1
        shiftDown(0)
        return nodes[heapSize]
    }

    mutating func add(_ e: T) {
        if heapSize == nodes.count {
            nodes.append(e)
        } else {
            nodes[heapSize] = e
        }
        heapSize += 1
        shiftUp(heapSize - 1)
    }

    mutating func heapSort() {
        while heapSize > 0 {
            nodes.swapAt(0, heapSize - 1)
            heapSize -= 1
            shiftDown(0)
        }
    }

    // MARK: - private methods

    var nodes: [T]
    var heapSize: Int
    private var sort: (T, T) -> Bool

    // MARK: - private functions

    private func left(_ i: Int) -> Int {
        return 2 * i + 1
    }

    private func right(_ i: Int) -> Int {
        return 2 * i + 2
    }

    private func parent(_ i: Int) -> Int {
        return (i - 1)/2
    }

    private mutating func buildHeap() {
        for i in stride(from: heapSize/2, through: 0, by: -1) {
            shiftDown(i)
        }
    }

    private mutating func shiftDown(_ i: Int) {
        var i = i
        while i < heapSize {
            let l = left(i)
            let r = right(i)
            var swap = i

            if l < heapSize && sort(nodes[l], nodes[i]) {
                swap = l
            }

            if r < heapSize && sort(nodes[r], nodes[swap]) {
                swap = r
            }

            if swap == i {
                break
            }

            nodes.swapAt(swap, i)
            i = swap
        }
    }

    private mutating func shiftUp(_ i: Int) {
        var i = i
        while i > 0 {
            let p = parent(i)
            if sort(nodes[i], nodes[p]) {
                nodes.swapAt(i, p)
            }

            i = p
        }
    }
}
