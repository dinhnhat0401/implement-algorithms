//
//  BellmanFord.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/22.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

import Foundation

//Bellman-Ford(G,W,s)
//    Initialize ()
//    for i = 1 to |V | − 1
//        for each edge (u, v) ∈ E:
//            Relax(u, v)
//
//    // check
//    for each edge (u, v) ∈ E
//        do if d[v] > d[u] + w(u, v)
//            then report a negative-weight cycle exists
