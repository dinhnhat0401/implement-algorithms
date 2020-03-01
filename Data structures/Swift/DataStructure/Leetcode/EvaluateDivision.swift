//
//  EvaluateDivision.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class EvaluateDivision {
    private var nodes = [String: Node]()
    private var weights = [[String]: Double]()

    func calcEquation2(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var quot = [String: [String: Double]]()
        for (i, e) in equations.enumerated() {
            let v = values[i]
            quot[e[0], default: [String: Double]()][e[0]] = 1.0
            quot[e[1], default: [String: Double]()][e[1]] = 1.0
            quot[e[0], default: [String: Double]()][e[1]] = v
            quot[e[1], default: [String: Double]()][e[0]] = 1/v
        }

        for k in quot.keys {
            for i in quot[k, default: [String: Double]()].keys {
                for j in quot[k, default: [String: Double]()].keys {
                    quot[i]![j] = quot[i]![k]! * quot[k]![j]!
                }
            }
        }

        var res = [Double]()
        for q in queries {
            res.append(quot[q[0]]?[q[1]] ?? -1.0)
        }

        return res
    }

    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var result = [Double]()
        var count = 0
        for e in equations {
            addEdge(e, values[count])
            weights[e] = values[count]
            weights[[e[1], e[0]]] = 1.0 / values[count]
            count += 1
        }
        for q in queries {
            result.append(bfs(q[0], q[1]))
        }
        return result
    }

    func addEdge(_ e: [String], _ val: Double) {
        let from = nodes[e[0]]
        let to = nodes[e[1]]
        if from == nil {
            nodes[e[0]] = Node(e[0])
        }
        if to == nil {
            nodes[e[1]] = Node(e[1])
        }
        nodes[e[0]]!.adj.append(nodes[e[1]]!)
        nodes[e[1]]!.adj.append(nodes[e[0]]!)
    }

    func bfs(_ from: String, _ to: String) -> Double {
        let s = nodes[from]
        let d = nodes[to]
        guard s != nil, d != nil else {
            return -1.0
        }
        var visited = Set<Node>([s!])
        var frontier = [s!]
        var p = [Node: Node]()
        while frontier.count > 0 {
            var next = [Node]()
            for n in frontier {
                for a in n.adj {
                    if visited.contains(a) {
                        continue
                    }
                    visited.insert(a)
                    p[a] = n
                    if a == d {
                        break
                    }
                    next.append(a)
                }
            }
            frontier = next
        }

        var cur = d!
        var result = 1.0
        while cur != s {
            if p[cur] == nil {
                return -1.0
            }

            result *= weights[[p[cur]!.name, cur.name]]!
            cur = p[cur]!
        }

        return result
    }
}

private class Node: Hashable, Equatable {
    var name: String
    var adj: [Node]

    init(_ name: String) {
        self.name = name
        self.adj = [Node]()
    }

    static func ==(rhs: Node, lhs: Node) -> Bool {
        return rhs.name == lhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
