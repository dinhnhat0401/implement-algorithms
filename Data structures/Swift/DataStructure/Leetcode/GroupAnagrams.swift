//
//  GroupAnagrams.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/03.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class GroupAnagrams {
    class func test() {
        GroupAnagrams().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    }
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // Because Int conforms to Equatable protocol static func == is available to compare two array a1: [Int], a2: [Int]
        // So we can use [Int] as a
        var hashmap = [[Int]: [String]]()
        // use a hash map
        // key: an integer array with length 26 ('z' - 'a'), value: an array of strings
        // concat values we get the result
        let a = Character("a").asciiValue
        let z = Character("z").asciiValue

        for str in strs {
            var app = [Int](repeating: 0, count: Int(z! - a! + 1))
            for c in str {
                app[Int(c.asciiValue! - a!)] += 1
            }

            if hashmap[app] == nil {
                hashmap[app] = []
            }

            hashmap[app]!.append(str)
        }

        return [[String]](hashmap.values)
    }
}
