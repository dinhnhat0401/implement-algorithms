//
//  FindAnagrams.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/05/06.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class FindAnagrams {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count {
            return []
        }

        let rc = RollingCount()
        let p = Array(p)
        for c in p {
            rc.skip(c)
        }

        var l = 0
        var r = 0
        let s = Array(s)

        while r < p.count - 1 {
            rc.append(s[r])
            r += 1
        }

        var res = [Int]()
        while l <= r && r < s.count {
            rc.append(s[r])
            if rc.count == 0 {
                res.append(l)
            }

            rc.skip(s[l])
            l += 1
            r += 1
        }

        return res
    }
}

class RollingCount {
    let a = Int(Character("a").asciiValue!)

    var count = 0
    var pCharArr = [Int](repeating: 0, count:26)

    func append(_ c: Character) {
        let idx = Int(c.asciiValue!) - a
        pCharArr[idx] += 1
        if pCharArr[idx] == 0 {
            count -= 1
        }
    }

    func skip(_ c: Character) {
        let idx = Int(c.asciiValue!) - a
        if pCharArr[idx] == 0 {
            count += 1
        }
        pCharArr[idx] -= 1
    }
}
