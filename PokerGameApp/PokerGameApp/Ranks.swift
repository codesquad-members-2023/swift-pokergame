//
//  Ranks.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

enum Ranks: String, CaseIterable {
    case one = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "J"
    case twelve = "Q"
    case thirteen = "K"
}

extension Ranks: CustomStringConvertible {
    var description: String {
        switch self {
        case.one :
            return Ranks.one.rawValue
        case.two :
            return Ranks.two.rawValue
        case.three :
            return Ranks.three.rawValue
        case.four :
            return Ranks.four.rawValue
        case.five :
            return Ranks.five.rawValue
        case.six :
            return Ranks.six.rawValue
        case.seven :
            return Ranks.seven.rawValue
        case.eight :
            return Ranks.eight.rawValue
        case.nine :
            return Ranks.nine.rawValue
        case.ten :
            return Ranks.ten.rawValue
        case.eleven :
            return Ranks.eleven.rawValue
        case.twelve :
            return Ranks.twelve.rawValue
        case.thirteen :
            return Ranks.thirteen.rawValue
        }
    }
}


