//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

import Foundation

class CardDeck {
    private var cardList = [Card?]()
    
    func count() -> Int {
        return cardList.count
    }
    
    func shuffle() {
        for i in 0 ..< (cardList.count - 1) {
            let randomIndex = Int.random(in: i ..< cardList.count)
            cardList.swapAt(i, randomIndex)
        }
    }
    
    func removeOne() -> Card? {
        let index = count() > 0 ? cardList.count - 1 : -1
        let removedCard = index != -1 ? cardList[index] : nil
        if removedCard != nil {
            cardList.removeLast()
        }
        return removedCard
    }
    
    func reset() {
        if !cardList.isEmpty { cardList.removeAll() }
        for suit in Suits.allCases {
            for rank in Ranks.allCases {
                let card = Card(suit: suit, rank: rank)
                cardList.append(card)
            }
        }
    }
}
