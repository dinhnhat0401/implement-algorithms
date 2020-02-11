//
//  Logger.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2020/02/10.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class Logger {
    static func debug(file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            let className = file.components(separatedBy: "/").last
            print("\(className ?? ""), Function: \(function), Line: \(line)")
        #endif
    }
}
