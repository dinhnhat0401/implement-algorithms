//
//  Test.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/01/25.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class Test {
    public func solution(_ A : inout [Int]) -> Int {
        // create a map M with keys are elements in A, values is their index
        // sort array A by ascending order
        // have a pointers i = 1
        // initialize a result variable
        // while i < A.count
            // while A[i] == A[i - 1]
                // i += 1
            // result = max(result, M[A[i]].last - M[A[i - 1]].first)
        var M = [Int: [Int]]()
        for (i, n) in A.enumerated() {
            if M[n] == nil {
                M[n] = [Int]()
            }
            M[n]!.append(i)
        }
        A.sort(by: <)
        var result = -1
        var i = 1

        while i < A.count {
            while A[i] == A[i - 1] {
                i += 1
            }
            result = max(result, abs(M[A[i]]!.last! - M[A[i - 1]]!.first!))
            i += 1
        }

        return result
    }
}
