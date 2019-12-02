//
//  4Sum.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/02.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class FourSum {
    static func test() {
        print(FourSum().fourSum1([1,0,-1,0,-2,2], 0))
    }
    // idea:
    // 1. Keep an element in range [2, nums.count - 2] as axis
    // 2. Find all posible sum of two elements in range [0, x), put it to a Hashtable,
    // Hashtable:
    // key = target - sum1 : value = [[Int]]
    // 3. Check if we can find any couple with sum equal to sum2 in range [x, n)
    // if so, we put sum1's couple and sum2's couple to an array and then add it to result
    func fourSum1(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count <= 3 {
            return []
        }

        var nums = nums
        nums.sort(by: { $0 < $1 })
        var results = Set<[Int]>()

        for i in 2 ... nums.count - 2 {
            var hashtable = [Int: Set<[Int]>]()
            for j in 0 ..< i - 1 {
                for k in j + 1 ..< i {
                    let key1 = target - (nums[j] + nums[k])
                    if hashtable[key1] != nil {
                        hashtable[key1]?.insert([nums[j], nums[k]])
                    } else {
                        hashtable[key1] = []
                        hashtable[key1]?.insert([nums[j], nums[k]])
                    }
                }
            }

            for l in i ..< nums.count - 1 {
                for m in l + 1 ..< nums.count {
                    let key = nums[l] + nums[m]
                    if hashtable[key] != nil {
                        for var arr: [Int] in hashtable[key]! {
                            arr.append(nums[l])
                            arr.append(nums[m])

                            results.insert(arr)
                        }
                    }
                }
            }
        }

        return Array(results)
    }

    // idea 2
    // try to fix 2 positions, i, j make problem becomes two sum

    func fourSum2(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count <= 3 {
            return []
        }

        var nums = nums
        // nums.sort(by: { $0 < $1 })
        var results = Set<[Int]>()

        for i in 0 ..< nums.count - 1 {
            for j in i + 1 ..< nums.count {
                let twoSumResults = twoSum(nums, target - nums[i] - nums[j], [i, j])
                if twoSumResults.count > 0 {
                    for twoSumResult in twoSumResults {
                        var candidate = [nums[i], nums[j], twoSumResult[0], twoSumResult[1]]
                        candidate.sort(by: { $0 < $1 })
                        results.insert(candidate)
                    }
                }
            }
        }

        return Array(results)
    }

    func twoSum(_ nums: [Int], _ target: Int, _ excludes: [Int]) -> [[Int]] {
        var results = [[Int]]()
        // use a set to store target - first
        // note: need to skip all indexes included in excludes

        var set = Set<Int>()
        for (i, n) in nums.enumerated() {
            if excludes.contains(i) {
                continue
            }

            if set.contains(n) {
                results.append([target - n, n])
            } else {
                set.insert(target - n)
            }
        }

        return results
    }

    // idea 3
    // use a hashtable to store sum of each pair
    //

    func fourSum3(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count <= 3 {
            return []
        }

        var nums = nums
        nums.sort(by: { $0 < $1 })

        var hashtable = [Int: [[Int]]]()
        var results = Set<[Int]>()

        for i in 0 ..< nums.count - 1 {
            for j in i + 1 ..< nums.count {
                let sum = nums[i] + nums[j]
                if hashtable[sum] != nil {
                    for pair in hashtable[sum]! {
                        if pair[0] != i && pair[0] != j && pair[1] != i && pair[1] != j {
                            var candidate = [nums[pair[0]], nums[pair[1]], nums[i], nums[j]]
                            candidate.sort(by: { $0 < $1 })
                            results.insert(candidate)
                        }
                    }
                }

                if hashtable[target - sum] == nil {
                    hashtable[target - sum] = []
                }
                hashtable[target - sum]!.append([i, j])
            }
        }

        return Array(results)
    }
}
