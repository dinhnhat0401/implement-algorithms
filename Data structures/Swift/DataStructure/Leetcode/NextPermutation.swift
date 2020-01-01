//
//  NextPermutation.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2019/12/30.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        // go from left to right
        // find the index that a[i - 1] < a[i]
        // find a[j] in range [i, nums.count) such that
        // a[j] is the smallest number greater than a[i - 1] (upper bound)
        // swap a[i - 1], a[j]
        // reverse nums from index i to nums.count - 1
        var i = nums.count - 1
        while i > 0 {
            if nums[i - 1] < nums[i] {
                let j = bs(nums, i, nums.count - 1, nums[i - 1])
                nums.swapAt(i - 1, j)
                swap(&nums, i, nums.count - 1)
                return
            }
            i -= 1
        }

        swap(&nums, 0, nums.count - 1)
    }

    func swap(_ nums: inout [Int], _ l: Int, _ r: Int) {
        var l = l
        var r = r
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }


    func bs(_ nums: [Int], _ l: Int, _ r: Int, _ val: Int) -> Int {
        var l = l
        var r = r
        var ans = -1

        while l <= r {
            let mid = l + (r - l)/2
            if nums[mid] <= val {
                r = mid - 1
            } else {
                ans = mid
                // go right to find better candidates
                l = mid + 1
            }
        }

        return ans
    }
}
