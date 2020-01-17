//
//  BackspaceCompare.swift
//  DataStructure
//
//  Created by Dinh, Nhat | Nate | MPB on 2020/01/17.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class BackspaceCompare {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        // go from end to begining of S & T compare each two characters
        // skip character if found any backscape #
        let S = Array(S)
        let T = Array(T)

        var i = S.count - 1
        var j = T.count - 1

        var skipS = 0
        var skipT = 0

        while i >= 0 || j >= 0 {
            while i >= 0 {
                if S[i] == "#" {
                    skipS += 1
                    i -= 1
                } else if skipS > 0 {
                    skipS -= 1
                    i -= 1
                } else {
                    break
                }
            }

            while j >= 0 {
                if T[j] == "#" {
                    skipT += 1
                    j -= 1
                } else if skipT > 0 {
                    skipT -= 1
                    j -= 1
                } else {
                    break
                }
            }

            if i >= 0 && j >= 0 && S[i] != T[j] {
                return false
            }

            if (i >= 0) != (j >= 0) {
                return false
            }

            i -= 1
            j -= 1
        }

        return true
    }
}
