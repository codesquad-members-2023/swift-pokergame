//
//  Ranks.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

enum Ranks: Int, CaseIterable {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
}

extension Ranks: CustomStringConvertible {
    var description: String {
        switch self {
        case.one :
            return "A"
        case.two :
            return "2"
        case.three :
            return "3"
        case.four :
            return "4"
        case.five :
            return "5"
        case.six :
            return "6"
        case.seven :
            return "7"
        case.eight :
            return "8"
        case.nine :
            return "9"
        case.ten :
            return "10"
        case.eleven :
            return "J"
        case.twelve :
            return "Q"
        case.thirteen :
            return "K"
        }
    }
}


