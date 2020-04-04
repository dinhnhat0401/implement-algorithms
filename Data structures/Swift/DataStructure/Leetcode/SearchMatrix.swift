//
//  SearchMatrix.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/15.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class SearchMatrix {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }

        var maxC = bfs(matrix[0], target)
        if maxC == -1 {
            return false
        }

        for c in 0 ... maxC {
            var u = 0
            var d = matrix.count - 1
            while u <= d {
                let mid = u + (d - u)/2
                if matrix[mid][c] == target {
                    return true
                }

                if matrix[mid][c] > target {
                    d = mid - 1
                } else {
                    u = mid + 1
                }
            }
        }

        return false
    }

    func bfs(_ arr: [Int], _ t: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        var ans = -1

        while l <= r {
            let mid = l + (r - l)/2
            if arr[mid] == t {
                return mid
            }

            if arr[mid] > t {
                r = mid - 1
            } else {
                l = mid + 1
                ans = mid
            }
        }

        return ans
    }
}
