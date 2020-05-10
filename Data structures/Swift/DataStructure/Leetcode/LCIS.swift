//
//  LCIS.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/05/10.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class LCIS {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var l = 0
        var r = 1
        var maxL = 0
        while l <= r && r < nums.count {
            if nums[r] <= nums[r - 1] {
                maxL = max(maxL, r - l)
                l = r
            } else if r == (nums.count - 1) {
                maxL = max(maxL, r - l + 1)
            }
            r += 1
        }

        return maxL
    }
}
