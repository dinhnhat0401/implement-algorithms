//
//  KWeakestRows.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/02.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class KWeakestRows {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        // go through the mat to build array of indexes and number of soliders in that row
        // sort the array by number of soliders
        // return k first elements
        var arr = [[Int]]()
        for i in 0 ..< mat.count {
            // calculate number of soliders in row mat[i]
            var count = 0
            var j = 0
            while j < mat[i].count && mat[i][j] == 1 {
                count += 1
                j += 1
            }
            arr.append([i, count])
        }
        arr.sort(by: { $0[1] < $1[1] })
        return Array(arr[0...k-1]).map{ $0[0] }
    }
}
