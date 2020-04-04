//
//  LC126.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/04/04.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LC126 {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var words = Set<String>(wordList)
        words.insert(beginWord)

        var visited = Set<String>([beginWord])
        var p = [String: String]()
        var frontier = [beginWord]
        var result = [[String]]()
        let g = buildGraph(words)
        var needNextLevel = true
        while frontier.count > 0 {
            var next = [String]()
            for w in frontier {
                for nextW in findNext(w, g) {
                    if visited.contains(nextW) {
                        continue
                    }

                    if nextW == endWord {
                        // get result
                        var cur: String? = w
                        var r = [endWord]
                        while cur != nil {
                            r.append(cur!)
                            cur = p[cur!] ?? nil
                        }

                        result.append(r.reversed())
                        needNextLevel = false
                        continue
                    }

                    visited.insert(nextW)
                    next.append(nextW)
                    p[nextW] = w
                }
            }
            if !needNextLevel {
                break
            }
            frontier = next
        }

        return result
    }

    func findNext(_ w: String, _ g: [String: [String]]) -> [String] {
        var wArr = Array(w)
        var next = Set<String>()
        for i in 0 ..< wArr.count {
            let tmp = wArr[i]
            wArr[i] = "*"
            for nW in g[String(wArr), default: []] {
                if nW == w {
                    continue
                }
                next.insert(nW)
            }
            wArr[i] = tmp
        }

        return Array(next)
    }

    func buildGraph(_ words: Set<String>) -> [String: [String]] {
        var g = [String: [String]]()
        for w in words {
            var wArr = Array(w)
            for i in 0 ..< wArr.count {
                let tmp = wArr[i]
                wArr[i] = "*"
                g[String(wArr), default: []].append(w)
                wArr[i] = tmp
            }
        }

        return g
    }
}
