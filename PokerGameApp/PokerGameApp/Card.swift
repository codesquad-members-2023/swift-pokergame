//
//  Card.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/17.
//

import Foundation

class Card{
    var cardSuit: Suits
    var cardRank: Ranks
    
    init(suit: Suits, rank: Ranks) {
        cardSuit = suit
        cardRank = rank
    }
    
    enum Suits: String {
        case clubs = "♣"
        case diamonds = "◆"
        case hearts = "♥"
        case spades = "♠"
    }
    
    enum Ranks: String {
        case ace = "A", jack = "J", queen = "Q", king = "k"
        case two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10"
    }
    
    func makeCard() -> String {
        return (cardSuit.rawValue + cardRank.rawValue)
    }
}
