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
}
