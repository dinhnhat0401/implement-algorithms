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
            // each time we found a zero, change value of last non -1 value to -1 index j
            // e.g: 1 0 0 2 => 1 0 0 -1
        // for the second loop go from the end of array to the begining
            // try to shifting elements to the last of array and also dupliate 0 if we found any

        let N = arr.count
        var changeIndex = N - 1
        for i in 0 ..< N {
            if arr[i] == 0 && i < changeIndex {
                arr[changeIndex] = -1
                changeIndex -= 1
            }
        }

        var j = N - 1
        while j >= 0 {
            if arr[j] != -1 {
                break
            }
            j -= 1
        }

        while j >= 0 {
            var k = j + 1
            while k < N && arr[k] == -1 {
                k += 1
            }

            arr[k] = arr[j]
            if arr[j] == 0 && j < k - 1 {
                arr[k - 1] = 0
            }
            arr[j] = -1

            j -= 1
        }
    }
}
