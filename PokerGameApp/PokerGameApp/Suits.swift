//
//  Suits.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

enum Suits: Int, CaseIterable {
    case clubs = 1, diamonds, hearts, spades
}

extension Suits: CustomStringConvertible {
    var description: String {
        switch self {
        case.spades :
            return "♠"
        case.hearts :
            return "♥"
        case.diamonds :
            return "◆"
        case.clubs :
            return "♣"
        }
    }
}


