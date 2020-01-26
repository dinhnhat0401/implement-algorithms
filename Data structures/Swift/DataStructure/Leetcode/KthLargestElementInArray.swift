//
//  KthLargestElementInArray.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/26.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class KthLargestElementInArray {
    /// - Parameters:
    ///   - l: left index
    ///   - r: right index
    ///   - k: kth smallest element
    /// - Returns: the k-th smallest element of list within left...right
    func quickSelect(_ nums: inout [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
        // if l == r
            // return the only element
        // generate a random number r
        // partition the array into 2 parts return index of pivot element
            // [left-part] <= pivot < [right-part]
            // pivot_index = partition(l, r, pivot) with pivot = nums[random]
        // if pivot_index == k
            // return nums[pivot_index] since it's the k-th smallest element of the list
        // else if pivot_index > k
            // find k-th smallest element in the left-part by recursively call quickSelect
        // else
            // since we already found pivot_index-th smallest elements, we only need to find (k - pivot_index)-th smallest elements in the right-part
        if l == r {
            return nums[l]
        }

        let random = Int.random(in: l...r)
        let pivotIndex = partition(&nums, l, r, random)
        if pivotIndex == k {
            return nums[pivotIndex]
        }

        if pivotIndex > k {
            return quickSelect(&nums, l, pivotIndex - 1, k)
        }

        return quickSelect(&nums, pivotIndex + 1, r, k)
    }

    /// - Parameters:
    ///   - l: left index
    ///   - r: right index
    ///   - pivot: pivot value
    /// - Returns: new index of pivot element
    func partition(_ nums: inout [Int], _ l: Int, _ r: Int, _ pivotIndex: Int) -> Int {
        // use two pointers i, j
        // i = l, j = r
        let pivot = nums[pivotIndex]
        var i = l
        var j = r
        nums.swapAt(i, pivotIndex)
        i += 1
        while i <= j {
            while i <= j && nums[i] <= pivot {
                i += 1
            }

            while j >= i && nums[j] > pivot {
                j -= 1
            }

            if i >= j {
                break
            }

            nums.swapAt(i, j)
            i += 1
            j -= 1
        }

        nums.swapAt(l, j)
        return j
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let N = nums.count
        return quickSelect(&nums, 0, N - 1, N - k)
    }
}
