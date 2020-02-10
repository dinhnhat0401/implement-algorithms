//
//  SubArrays.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/02/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class SubArrays {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        if arr.count < k {
            return 0
        }

        var sum = 0
        for i in 0 ... k - 1 {
            sum += arr[i]
        }

        var count = 0
        if sum/k >= threshold {
            count += 1
        }

        if k == arr.count {
            return count
        }

        for i in k ..< arr.count {
            sum = sum - arr[i - k] + arr[i]
            if sum/k >= threshold {
                count += 1
            }
        }

        return count
    }
}
