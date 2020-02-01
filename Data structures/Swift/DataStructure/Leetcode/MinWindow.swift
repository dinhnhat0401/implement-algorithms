//
//  MinWindow.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/01.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class MinWindow {
    func minWindow(_ s: String, _ t: String) -> String {
        // use a hashmap to store characters in t and number of occurrence
        // sample: t = "ABC" => map = {A: 1, B: 1, C: 1}
        // use a counter variable to keep track of characters need to appear
        // at the beginning counter = t.count, after traverse the s string counter is decrease and eventually become 0 => we know that the substring create by two pointers contains all characters in t
        // result = [startIndex, range]
        // while j < s.count {
            // if s[j] is not belong to t
                // increase j and continue
            // if we need s[j] to make the substring contains all character in t (== map[s[j]] > 0)
                // decrease counter
            // decrease map[s[j]]

            // while the substring contains all characters in t (== counter == 0)
                // let range = j - i + 1
                // if result[1] > range
                    // result[1] = range, result[0] = i
                // increasing i to find a smaller range
                // if map[s[i]] != nil
                    // map[s[i]]! += 1
                    // if the removing of s[i] make s[i, j] substring missing s[i] (== map[s[i]] > 0)
                        // increase counter
                // i+= 1

            // j += 1
        // }
        // return result
        let s = Array(s)
        let t = Array(t)
        var map = [Character: Int]()
        for c in t {
            // assuming that each characters only display once in t
            // what happen if otherwise
            map[c] = (map[c] ?? 0) + 1
        }
        var i = 0
        var j = 0
        var counter = t.count
        var result = [0, Int.max]
        while j < s.count {
            if (map[s[j]] ?? 0) > 0 {
                counter -= 1
            }
            map[s[j]] = (map[s[j]] ?? 0) - 1

            while counter == 0 {
                let range = j - i + 1
                if result[1] > range {
                    result[1] = range
                    result[0] = i
                }

                map[s[i]]! += 1
                if map[s[i]]! > 0 {
                    counter += 1
                }

                i += 1
            }
            j += 1
        }

        return result[1] == Int.max ? "" : String(s[result[0] ..< result[0] + result[1]])
    }
}
