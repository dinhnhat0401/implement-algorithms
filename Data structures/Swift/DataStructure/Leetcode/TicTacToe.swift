//
//  TicTacToe.swift
//  DataStructure
//
//  Created by Đinh Văn Nhật on 2019/12/01.
//  Copyright © 2019 Đinh Văn Nhật. All rights reserved.
//

class TicTacToe {
    static func test() {
        TicTacToe().tictactoe([[0,0],[2,0],[1,1],[2,1],[2,2]])
    }

    func tictactoe(_ moves: [[Int]]) -> String {
        var t = Array(repeating: Array(repeating: 0, count: 3), count: 3)
        if moves.count == 0 {
            return "Draw"
        }

        // fill the maze
        for (index, move) in moves.enumerated() {
            t[move[0]][move[1]] = (index % 2 == 1 ? 1 : 0)
        }

        // check the last move
        // if last move ends the game => print A or B
        if checkMove(moves[moves.count - 1], t) {
            let result = moves.count % 2 == 1 ? "A" : "B"
            return result
        }

        // else we have pending or draw result base on moves.count
        return moves.count == 9 ? "Draw" : "Pending"
    }

    func checkMove(_ move:[Int], _ t:[[Int]]) -> Bool {
        return checkRow(move[0], t) || checkCol(move[1], t) || checkDiagonal(t)
    }

    func checkRow(_ row: Int, _ t:[[Int]]) -> Bool {
        return t[row][0] == t[row][1] && t[row][1] == t[row][2]
    }

    func checkCol(_ col: Int, _ t:[[Int]]) -> Bool {
        return t[0][col] == t[1][col] && t[1][col] == t[2][col]
    }

    func checkDiagonal(_ t:[[Int]]) -> Bool {
        return (t[0][0] == t[1][1] && t[1][1] == t[2][2]) || (t[0][2] == t[1][1] && t[1][1] == t[2][0])
    }
}
