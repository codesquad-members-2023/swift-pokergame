//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by PJB on 2023/03/22.
//

import Foundation

struct CardDeck {
    
    private var cards: [Card]
    private let newCards: [Card]
    
    var cardCount: Int {
        return cards.count
    }
    
}
