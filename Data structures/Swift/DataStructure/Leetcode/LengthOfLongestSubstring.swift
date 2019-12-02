//
//  LengthOfLongestSubstring.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/01.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }

        var set = Set<Character>()
        var result = -1
        var l = 0
        var r = 0
        // for each character in string s from left to right
        // try to find longest substring from the i index
        // use a set to store unique characters and check if we found any repeated character
        while l < s.count && r < s.count {
            let c = s[s.index(s.startIndex, offsetBy: r)]

            if !set.contains(c) {
                set.insert(c)
                result = max(result, set.count)
                r += 1
            } else {
                let start = s[s.index(s.startIndex, offsetBy: l)]
                set.remove(start)
                l += 1
            }
        }

        return result
    }

    static func test() {
        print(LengthOfLongestSubstring().lengthOfLongestSubstring("abcabcabc"))
    }
}
