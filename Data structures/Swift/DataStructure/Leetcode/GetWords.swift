//
//  GetWords.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/05.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class GetWords {
    func expand(_ S: String) -> [String] {
        let tmp = S.components(separatedBy: ["{", "}"]).filter({!$0.isEmpty})
        var components = [[String]]()
        for str in tmp {
            var com = str.components(separatedBy: [","])
            com.sort(by: <)
            components.append(com)
        }
        var word = ""
        var res = [String]()
        dfs(0, components, &word, &res)
        return res
    }

    func dfs(_ componentIdx: Int, _ components: [[String]], _ word: inout String, _ res: inout [String]) {
        if componentIdx == components.count {
            res.append(word)
            return
        }

        for c in Array(components[componentIdx]) {
            word.append(c)
            dfs(componentIdx + 1, components, &word, &res)
            word.removeLast()
        }
    }
}
