//
//  CardDeck.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/15.
//

import Foundation

struct cardDeck{
    
    private var cardArray : [Card]
    
    init() {
        cardArray = []
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                let card = Card(shape: shape, number: number)
                cardArray.append(card)
            }
        }
    }
}
