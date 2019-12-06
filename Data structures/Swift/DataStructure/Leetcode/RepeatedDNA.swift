//
//  RepeatedDNA.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/06.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//
import Foundation

class RepeatedDNA {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let l = 10 // length of sequence

        if s.count <= l {
            return []
        }

        let s = Array(s)

        // from the beginning of the string
            // calculate hashed value of 10 letter long sequences
            // store hashed value in a setS
            // check if we find the hashed value in the setS
            // if so: add string to result set
            // we use a set to avoid duplicated result
            // if not add hashed result to set

        // using a rolling hash function

        var rh = RollingHash(l)
        for i in 0 ... l - 1 {
            rh.append(s[i])
        }
        var set = Set<Int>()
        set.insert(rh.val)

        var result = Set<String>()
        for i in l ..< s.count {
            // let skip = s.index(s.startIndex, offsetBy:i - l)
            // let append = s.index(s.startIndex, offsetBy:i)
            rh.skip(s[i - l])
            rh.append(s[i])
            if set.contains(rh.val) {
                result.insert(String(s[(i - l + 1)...i]))
            } else {
                set.insert(rh.val)
            }
        }

        return Array(result)
    }
}

struct RollingHash {
    var val = 0
    var b = 4
    var d:[Character: Int] = ["A": 0, "C": 1, "G": 2, "T": 3]
    var l = 10
    var p = 11
    var skipFactor = 0

    init(_ l: Int) {
        self.l = l
        skipFactor = Int(pow(Double(b), Double(l - 1)))
    }

    mutating func append(_ c: Character) {
        val = val * b + d[c]!
    }

    mutating func skip(_ c: Character) {
        val = val - d[c]! * skipFactor
    }
}
