//
//  Player.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/22.
//

import Foundation

class Player {
    private var name: String
    private var cardDeck: [Card?]
    
    init(name: String, cardDeck: [Card?]) {
        self.name = name
        self.cardDeck = cardDeck
    }
    
    func numberOfCards() -> Int {
        return cardDeck.count
    }
    
    func resetCards(cards: [Card?]) {
        self.cardDeck.removeAll()
        self.cardDeck = cards
    }
}
