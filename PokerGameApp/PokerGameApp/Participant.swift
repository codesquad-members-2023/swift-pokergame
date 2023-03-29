//
//  Participant.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/28.
//

import Foundation

class Participant {
    private var name: String
    private var deck = [Card?]()
    
    init(name: String) {
        self.name = name
    }
    
    func popCard(deck: CardDeck) -> Card? {
        return deck.removeOne()
    }

    func numberOfCards() -> Int {
        return deck.count
    }
    
    func setDeck(card: Card?) {
        self.deck.append(card)
    }
    
    func initDeck() {
        self.deck.removeAll()
    }
}
