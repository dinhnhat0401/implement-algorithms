//
//  MonarchyImplementation.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/01/18.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LoyalMember: Hashable, Equatable {
    var parent: LoyalMember? = nil
    var children = [LoyalMember]()
    var alive = true
    var name: String

    init(_ name: String) {
        self.name = name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func ==(lhs: LoyalMember, rhs: LoyalMember) -> Bool {
        return lhs.name == rhs.name
    }
}

protocol Monarchy {
    func birth(_ child: String, _ parent: String)
    func death(_ name: String)
    func getOrderOfSuccession() -> [String]
}

class MonarchyImplementation: Monarchy {
    func death(_ name: String) {
        members[name]?.alive = false
    }

    func getOrderOfSuccession() -> [String] {
        if members.count == 0 {
            return []
        }

        var result = [String]()
        // get to root loyal member (King)
        var m = members.first!.value
        while m.parent != nil {
            m = m.parent!
        }
        // posorder traverse from root by using recursive or stack
        dfs(m, &result)
        return result
    }

    func dfs(_ m: LoyalMember, _ res: inout [String]) {
        if m.alive {
            res.append(m.name)
        }

        for c in m.children {
            dfs(c, &res)
        }
    }

    func birth(_ child: String, _ parent: String) {
        // need a parent variable
        // if parent doesn't exist in members
            // create parent
            // add it to members
            // assign to parent variable
        // else
            // get parent from members
        // create child
        // append child to parent's children list
        var p: LoyalMember
        if members[parent] == nil {
            p = LoyalMember(parent)
            members[parent] = p
        } else {
            p = members[parent]!
        }

        let c: LoyalMember
        if members[child] == nil {
            c = LoyalMember(child)
            members[child] = c
        } else {
            c = members[child]!
        }

        p.children.append(c)
        c.parent = p
    }

    private var members = [String: LoyalMember]()
}
