//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by apple on 2023/03/20.
//

import Foundation


class CardDeck {
    var deck: [Card] = []
    
    init() {
        let allShape = Card.getAllShape()
        let allNumber = Card.getAllNumber()
        
        for cardShape in allShape {
            for cardNumber in allNumber {
                self.deck.append(Card(number: cardNumber, shape: cardShape))
            }
        }
        
    }
    
    func count() -> Int {
        return self.deck.count
    }
    
    func shuffle() {
        
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
