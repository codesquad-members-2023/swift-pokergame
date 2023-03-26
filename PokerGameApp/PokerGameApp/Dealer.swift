//
//  Dealer.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/22.
//

import Foundation

class Dealer {
    private var cardDeck = [Card?]()

    func cardDistribution(deck: CardDeck, numberOfCard: Int) -> [Card?] {
        var cards = [Card?]()

        for _ in 0 ..< numberOfCard {
            if let card = deck.removeOne() { cards.append(card) }
        }
        
        return cards
    }
    
    func selfDistribution(deck: CardDeck, numberOfCard: Int) {
        self.cardDeck = cardDistribution(deck: deck, numberOfCard: numberOfCard)
    }
    
    func resetCards(cards: [Card?]) {
        self.cardDeck.removeAll()
        self.cardDeck = cards
    }

    func numberOfCards() -> Int {
        return cardDeck.count
    }

    func cardList() -> [Card?] {
        return cardDeck
    }
}
