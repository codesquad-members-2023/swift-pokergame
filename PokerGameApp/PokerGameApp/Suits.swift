//
//  Suits.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

enum Suits: String, CaseIterable {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "◆"
    case clubs = "♣"
}

extension Suits: CustomStringConvertible {
    var description: String {
        switch self {
        case.spades :
            return Suits.spades.rawValue
        case.hearts :
            return Suits.hearts.rawValue
        case.diamonds :
            return Suits.diamonds.rawValue
        case.clubs :
            return Suits.clubs.rawValue
        }
    }
}


