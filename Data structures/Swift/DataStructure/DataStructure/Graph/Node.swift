//
//  Node.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/16.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

public class Node<T> where T: Hashable {
    var data: T
    var adj: [Node<T>]

    init(data: T) {
        self.data = data
        self.adj = [Node<T>]()
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

extension Node: Equatable {
    static func ==<T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }
}
