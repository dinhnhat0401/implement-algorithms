//
//  RotateImage.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/08.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation

class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        // for layer in 1 ... n/2
            // swap parts in each layer
            // each layer includes 4 parts:
                // [layer - 1, layer - 1] -> [layer - 1, n - 1 - layer]
                // [layer - 1, n - layer] -> [n - 1 - layer, n - layer]
                // [n - layer, n - layer] -> [n - layer, layer]
                // [n - layer, layer - 1] -> [layer, layer - 1]
        let n = matrix.count
        for layer in 1 ... n/2 {
            var tmp = [Int]()
            for i in layer ... n - layer {
                tmp.append(matrix[i][layer - 1])
            }

            for i in layer ... n - layer {
                matrix[i][layer - 1] = matrix[n - layer][i]
                matrix[n - layer][i] = matrix[n - 1 - i][n - layer]
                matrix[n - 1 - i][n - layer] = matrix[layer - 1][n - 1 - i]
                matrix[layer - 1][n - 1 - i] = tmp[i - layer]
            }
        }
    }
}
