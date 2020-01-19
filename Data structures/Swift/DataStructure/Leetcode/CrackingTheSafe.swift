//
//  CrackingTheSafe.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/01/19.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class CrackingTheSafe {
    var seen = Set<String>()
    var edges = [Int]()

    func crackSafe(_ n: Int, _ k: Int) -> String {
        var A = [String]()
        for i in 0 ..< k {
            A.append(String(i))
        }
        let startingNode = String(repeating: A[0], count: n - 1)
        dfs(startingNode, k, A)
        var deBruijn = ""
        let l = Int(pow(Double(k), Double(n)))
        for i in 0 ..< l {
            deBruijn += A[edges[i]]
        }
        deBruijn += startingNode

        return deBruijn
    }

    func dfs(_ node: String, _ k: Int, _ A: [String]) {
        for i in 0 ..< k {
            let str = node + A[i]
            if !seen.contains(str) {
                seen.insert(str)
                dfs(String(str[str.index(str.startIndex, offsetBy: 1)...]), k, A)
                edges.append(i)
            }
        }
    }
}
