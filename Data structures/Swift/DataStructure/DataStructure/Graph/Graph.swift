//
//  Graph.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/16.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//


public struct Graph<T> where T: Hashable {

    public var V: Int
    public var E: Int

    public init() {
        self.V = 0
        self.E = 0
    }

    public mutating func addUndirectedEdge(_ data1: T, _ data2: T) {
        let node1 = getNode(data1) ?? Node(data: data1)
        let node2 = getNode(data2) ?? Node(data: data2)
        node1.adj.append(node2)
        node2.adj.append(node1)
        nodes.updateValue(node1, forKey: data1)
        nodes.updateValue(node2, forKey: data2)
        self.E += 1
    }

    public func bfs(_ src: T, _ des: T) -> Bool {
        // get node src, get node des
        guard let source = nodes[src], let destination = nodes[des] else {
            return false
        }

        var visited = Set<Node<T>>()

        // create a queue for BFS purpose
        var q = LinkedList<Node<T>>()

        // enqueue src node
        q.append(source)

        // while queue is not empty try to
        while !q.isEmpty() {
            // dequeue get first element
            let first = try! q.removeFirst()
            // for each adjacency node of first
            for adj in first.adj {
                // if this is the node we are looking for => return true, since we found it
                if adj == destination {
                    return true
                }
                // if element is not traversed - color = 0
                if visited.contains(adj) {
                    // change adjacency node color to 1
                    visited.insert(adj)
                    // enqueue
                    q.append(adj)
                }
            }
        }
        // return false since we searched hole graph
        return false
    }

    func getNode(_ data: T) -> Node<T>? {
        return nodes[data]
    }

    // MARK: - private variables

    private var nodes = [T: Node<T>]()
}

extension Graph: CustomStringConvertible {
    public var description: String {
        var str = "V = \(self.V), E = \(self.E)\n"
        for node in nodes.values {
            str += "\(node.data) -> "
            str += "\(node.adj)\n"
        }
        return str
    }
}
