//
//  LC6.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/03/10.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }

        var s = Array(s)
        var res = ""
        let MOD = 2 * numRows - 2
        var lines = [[Character]](repeating: [], count: numRows)
        for i in 0 ..< s.count {
            var l = (i % MOD)
            if l >= numRows {
                l = MOD - l
            }
            lines[l].append(s[i])
        }

        for line in lines {
            res += String(line)
        }

        return res
    }
}
