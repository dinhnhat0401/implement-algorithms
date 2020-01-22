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
            // each layer includes 4 parts:
                // top = [layer - 1][i] with i in [layer - 1, n - 1 - layer]
                // or top = [layer - 1][i -1] with i in [layer, n - layer]
                // right = [i][n - layer] with i in [layer - 1, n - 1 - layer]
                // or right = [i - 1][n - layer] with i in [layer, n - layer]
                // bottom = [n - layer][i] with i in [n - layer, layer]
                // or bottom = [n - layer][n - i] with i in [layer, n - layer]
                // left = [i][layer - 1] with i in [n - layer, layer]
                // or left = [n - i][layer - 1] with i in [layer, n - layer]

            // create a temporary array to store left
            // swap bottom -> left, right -> bottom, top -> right, temporary -> top

        let n = matrix.count
        for layer in 1 ... n/2 {
            for i in layer ... n - layer {
                let tmp = matrix[n - i][layer - 1]
                matrix[n - i][layer - 1] = matrix[n - layer][n - i]
                matrix[n - layer][n - i] = matrix[i - 1][n - layer]
                matrix[i - 1][n - layer] = matrix[layer - 1][i - 1]
                matrix[layer - 1][i - 1] = tmp
            }
        }
    }
}
