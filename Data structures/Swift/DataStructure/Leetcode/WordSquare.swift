//
//  WordSquare.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/11.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class WordSquare {
    func wordSquares(_ words: [String]) -> [[String]] {
        if words.count == 0 {
            return []
        }

        var res = Set<[String]>()
        if words[0].count == 1 {
            for w in words {
                if w.count == 1 {
                    res.insert([w])
                }
            }
            return Array(res)
        }

        var curWords = [String]()
        for i in 0 ..< words.count {
            curWords = [String]()
            dfs(words, i, &curWords, &res)
        }
        return Array(res)
    }

    func dfs(_ words: [String], _ idx: Int, _ curWords: inout [String], _ res: inout Set<[String]>) {
        if curWords.count == words[0].count {
            res.insert(curWords)
            return
        }
        curWords.append(words[idx])

        for i in 0 ..< words.count {
            curWords.append(words[i])
            if check(curWords) {
               dfs(words, i + 1, &curWords, &res)
            }
            curWords.removeLast()
        }
    }

    func check(_ words: [String]) -> Bool {
        if words.count == 0 || words.count > words[0].count {
            return false
        }

        if words.count == 1 {
            return true
        }

        let N = words.count
        for r in 0 ..< N {
            for c in 0 ..< N {
                let wr = words[r]
                let wc = words[c]
                if wr[wr.index(wr.startIndex, offsetBy: c)] != wc[wc.index(wc.startIndex, offsetBy: r)] {
                    return false
                }
            }
        }

        return true
    }
}
