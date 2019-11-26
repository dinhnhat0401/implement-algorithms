//
//  MeetingRooms.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/11/26.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation
class MeetingRooms {
    func canAttendMeetings(_ intervals: inout [[Int]]) -> Bool {
        intervals.sort { (e1, e2) in
            return e1[0] - e2[0] < 0
        }
        print(intervals)
        return false
    }

    // https://leetcode.com/problems/meeting-rooms-ii
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.count <= 1 {
            return intervals.count
        }

        var intervals = intervals
        var roomCount = 0

        // sort intervals by starting time
        intervals.sort(by: { $0[0] < $1[0] })

        var h = Heap<Int>(sort: <);
        h.add(intervals[0][1])
        roomCount += 1

        for i in 1...intervals.count - 1 {
            let next = h.peek() // next available room
            if next <= intervals[i][0] {
                h.extract()
            } else {
                roomCount += 1
            }
            h.add(intervals[i][1])
        }

        return roomCount
    }
}
