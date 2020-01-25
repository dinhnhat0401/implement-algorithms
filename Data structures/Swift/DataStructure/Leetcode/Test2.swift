//
//  Test2.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/25.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class Test2 {
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 4.2.1 (Linux)
        // the idea is about using two pointers method
        // with a map to keep track of elements available in the current range [i, j] and their index
        // TIME COMPLEXITY: O(n) with n = A.count since we at most go through each element twice
        // SPACE COMPLEXITY: O(n) with n = A.count for the map
        var i = 0
        var j = 0
        var result = 0
        var M = [Int: Int]()
        while j < A.count && i < A.count {
            M[A[j]] = j
            if M.keys.count <= 2 {
                result = max(result, j - i + 1)
            } else {
                let to_del = M.min { $0.value < $1.value }
                M.removeValue(forKey: to_del!.key)
                i = to_del!.value + 1
            }
            j += 1
        }

        return result
    }
}
