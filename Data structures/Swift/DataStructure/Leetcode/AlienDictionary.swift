//
//  AlienDictionary.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class AlienDictionary {
    let N = 26
    let a = Int(Character("a").asciiValue!)
    func alienOrder(_ words: [String]) -> String {
        if words.count == 0 {
            return ""
        }

        if words.count == 1 {
            return words[0]
        }

        var g = [[Int]](repeating: [], count: N)
        var characters = Set<Int>()
        for i in 0 ..< words.count - 1 {
            let rule = extractRule(words[i], words[i + 1], &characters)
            if rule.count > 0 {
                g[rule[0]].append(rule[1])
            }
        }

        var order = [Int]()
        var visited = Set<Int>()
        var visiting = Set<Int>()
        for i in 0 ..< N {
            if visited.contains(i) || g[i].count == 0 {
                continue
            }

            if !dfs(i, g, &visited, &visiting, &order) {
                return ""
            }
        }

        for c in characters {
            if !visited.contains(c) {
                order.append(c)
            }
        }
        var result = [Character]()
        for o in order.reversed() {
            result.append(Character(UnicodeScalar(o + a)!))
        }
        return String(result)
    }

    func dfs(_ n: Int, _ g: [[Int]], _ visited: inout Set<Int>, _ visiting: inout Set<Int>, _ order: inout [Int]) -> Bool {
        if visited.contains(n) {
            return true
        }

        if visiting.contains(n) {
            return false
        }

        visiting.insert(n)
        for nei in g[n] {
            if !dfs(nei, g, &visited, &visiting, &order) {
                return false
            }
        }
        visiting.remove(n)
        visited.insert(n)
        order.append(n)
        return true
    }

    func extractRule(_ s1: String, _ s2: String, _ characters: inout Set<Int>) -> [Int] {
        let s1 = Array(s1)
        let s2 = Array(s2)

        var i = 0
        var result = [Int]()
        while i < min(s1.count, s2.count) {
            let t1 = Int(s1[i].asciiValue!) - a
            let t2 = Int(s2[i].asciiValue!) - a
            characters.insert(t1)
            characters.insert(t2)
            if t1 != t2 {
                result = [t1, t2]
                break
            }
            i += 1
        }

        while i < max(s1.count, s2.count) {
            if i < s1.count {
                let t = Int(s1[i].asciiValue!) - a
                characters.insert(t)
            }

            if i < s2.count {
                let t = Int(s2[i].asciiValue!) - a
                characters.insert(t)
            }

            i += 1
        }

        return result
    }
}
