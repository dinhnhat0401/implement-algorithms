//
//  DuplicateZeros.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/09.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class DuplicateZeros {
    func duplicateZeros(_ arr: inout [Int]) {
        // for the first loop from begining to the end of arr
            // each time we found a zero add one to zeroCount
        // zeroCount will contain number of zeros in arr
        // while zeroCount > 0 && j >= 0
            // if arr[j] == 0
                // decrease zeroCount
                // if j + zeroCount < N
                    // arr[j + zeroCount] = 0
                // if j + zeroCount + 1 < N
                    // arr[j + zeroCount + 1] = 0
            // else
                // fill in arr[j] for arr[j + zeroCount]

        let N = arr.count
        var zeroCount = 0
        for i in 0 ..< N {
            if arr[i] == 0 {
                zeroCount += 1
            }
        }

        var j = N - 1
        while zeroCount > 0 && j >= 0 {
            if arr[j] == 0 {
                zeroCount -= 1
            }

            if j + zeroCount < N {
                arr[j + zeroCount] = arr[j]
            }
            if arr[j] == 0 && j + zeroCount + 1 < N {
                arr[j + zeroCount + 1] = arr[j]
            }

            j -= 1
        }
    }
}
