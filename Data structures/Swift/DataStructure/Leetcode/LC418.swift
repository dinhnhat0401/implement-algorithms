//
//  LC418.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/27.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC418 {
    func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
        // merge all words in the sentence into a large string called merged
        // use a start variable to store number of characters we can put in the table
        // with each rows
            // increase start by cols
            // if merged[start] is a space == we can skip this space
            // else (we found a character here)
                // current word that the character belong to cannot be place in current row
                // need to
        var merged = ""
        for i in 0 ..< sentence.count {
            merged += sentence[i]
            merged += " "
        }

        let l = merged.count

        var start = 0
        for _ in 0 ..< rows {
            start += cols
            if merged[merged.index(merged.startIndex, offsetBy: (start % l))] == " " {
                start += 1
            } else {
                while start > 0 && merged[merged.index(merged.startIndex, offsetBy: ((start - 1) % l))] != " " {
                    start -= 1
                }
            }
        }

        return start/l
    }
}
