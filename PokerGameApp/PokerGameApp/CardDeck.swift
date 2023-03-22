//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 김하림 on 2023/03/21.
//

import Foundation

struct CardDeck {
    private var cardDeck:[PokerCard]
    
    init() {
        cardDeck = CardDeck.createDeck()
    }
    mutating func reset() {
        cardDeck = CardDeck.createDeck()
    }
    
    static func createDeck() -> [PokerCard] {
        var deck = [PokerCard]()
        let suits = PokerCard.Suit.allCases
        let ranks = PokerCard.Rank.allCases
        for suit in suits {
            for rank in ranks {
                let card = PokerCard(suit: suit, rank: rank)
                deck.append(card)
                }
        }
        return deck
    }
    
    mutating func removeOne() -> PokerCard? {
        guard let card = cardDeck.popLast() else {
            return nil
        }
        return card
    }
    
    mutating func shuffle() {
        for i in stride(from: cardDeck.count - 1, through: 1, by: -1) {
            let j = Int.random(in: 0..<i)
            if i != j {
                cardDeck.swapAt(i, j)
            }
        }
    }
    
    func count() -> Int {
        return cardDeck.count
    }

}
