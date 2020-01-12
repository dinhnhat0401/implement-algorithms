//
//  LongestSubstringsK.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/01/12.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LongestSubstringsK {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        // keep an map: [Character: Int] -> we want to keep track of number of keys available
        // var result = Int.min
        // need to keep track of two pointers: i = 0, j = 0
        // go from left to right of the string s, current character is s[j] = c
            // add s[j] to map, map[s[j]] += 1 need to initialize if needed
            // if map.keys.count > 2
                // result = max(result, j - i)
                // while map.keys.count > 2
                    // try to remove characters (s[i]) from map
                    // i += 1
            // increase j
        let k = 2
        let s = Array(s)
        var map = [Character: Int]()
        var result = Int.min
        var i = 0
        var j = 0

        while j < s.count {
            if map[s[j]] == nil {
                map[s[j]] = 0
            }
            map[s[j]] = map[s[j]]! + 1

            while map.keys.count > k {
                map[s[i]] = map[s[i]]! - 1
                if map[s[i]] == 0 {
                    map.removeValue(forKey: s[i])
                }
                i += 1
            }
            result = max(result, j - i + 1)

            j += 1
        }

        return result
    }
}
