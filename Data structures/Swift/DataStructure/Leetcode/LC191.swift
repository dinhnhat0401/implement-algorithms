//
//  LC191.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/03/23.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class LC191 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            if n % 10 != 0 {
                count += 1
            }
            n = n / 10
        }

        return count
    }
}
