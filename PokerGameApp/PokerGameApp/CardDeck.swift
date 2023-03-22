//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

import Foundation

struct CardDeck {
    private var cardList = [Card]()
    
    func count() -> Int {
        return cardList.count
    }
    
    mutating func shuffle() { // Knuth Shuffle 구현
        for i in 0 ..< (cardList.count - 1) {
            let randomIndex = Int.random(in: i ..< cardList.count)
            cardList.swapAt(i, randomIndex)
        }
    }
    
    mutating func removeOne() -> Card {
        let index = cardList.count - 1
        let removedCard = cardList[index]
        cardList.removeLast()
        return removedCard
    }
    
    mutating func reset() {
        if !cardList.isEmpty { cardList.removeAll() }
        for suit in Suits.allCases {
            for rank in Ranks.allCases {
                let card = Card(suit: suit, rank: rank)
                cardList.append(card)
            }
        }
    }
}
