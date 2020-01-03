//
//  MaxArea.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/03.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class MaxArea {
    func maxArea(_ height: [Int]) -> Int {
        var ans = -1
        var l = 0
        var r = height.count - 1
        while l < r {
            ans = max(ans, min(height[l], height[r]) * (r - l))
            if height[l] <= height[r] {
                var runner = l + 1
                while runner < r && height[runner] <= height[l] {
                    runner += 1
                }
                l = runner
            } else {
                var runner = r - 1
                while runner > l && height[runner] <= height[r] {
                    runner -= 1
                }
                r = runner
            }
        }

        return ans
    }
}
