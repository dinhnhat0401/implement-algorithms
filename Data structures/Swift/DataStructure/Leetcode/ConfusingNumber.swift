//
//  ConfusingNumber.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/29.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class ConfusingNumber {
    func confusingNumber(_ N: Int) -> Bool {
        // intialize rotated = 0
        // initialize a dictionary of valid digits: [0: 0, 1: 1, 6: 9, 8: 8, 9: 6]
        // simplify problem by get absolute of N
        // for each digit d in N (from last to first) - name?
            // if d is not a valid digit (valid.keys.contains(d) == false)
                // return false
            // calculate rotated value by add a new value to the end of it
                // rotated = rotated * 10 + valid[d]
        // if N == roated
            // return false
        // return true

        var N = N
        if N < 0 {
            N = -N
        }

        var rotated = 0
        let valid: [Int: Int] = [0: 0, 1: 1, 6: 9, 8: 8, 9: 6]
        var remain = N
        while remain > 0 {
            let d = remain % 10
            if !valid.keys.contains(d) {
                return false
            }

            rotated = rotated * 10 + valid[d]!
            remain = remain/10
        }

        if N == rotated {
            return false
        }
        return true
    }
}
