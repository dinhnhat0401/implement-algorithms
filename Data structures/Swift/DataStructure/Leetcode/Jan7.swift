//
//  Jan7.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2021/01/08.
//  Copyright © 2021 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class Jan7 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s);
        var i = 0;
        var j = 0;
        var longest = 0
        var arr = [Int](repeating: -1, count: 255)
        while i < s.count && j < s.count {
            while j < s.count && (arr[Int(s[j].asciiValue!)] == -1 || arr[Int(s[j].asciiValue!)] < i) {
                arr[Int(s[j].asciiValue!)] = j
                j += 1
            }
            longest = max(longest, j - i)
            if j == s.count {
                break
            }
            i = arr[Int(s[j].asciiValue!)] + 1
            arr[Int(s[j].asciiValue!)] = j
            j += 1
        }

        return longest
    }
}
