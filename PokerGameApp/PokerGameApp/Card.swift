//
//  Card.swift
//  PokerGameApp
//
//  Created by PJB on 2023/03/20.
//

import Foundation

struct Card {
    
    enum Suit: Character, CustomStringConvertible {
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    enum Rank: Int, CustomStringConvertible {
        case ace = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
    }
}
