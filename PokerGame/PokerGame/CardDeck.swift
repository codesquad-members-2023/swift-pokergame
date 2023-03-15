//
//  CardDeck.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/15.
//
import Foundation

struct CardDeck{
    
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
    
    mutating func shuffle() {
        for i in 0..<cardArray.count {
            if let randomIndex = (i+1..<cardArray.count).randomElement() {
                let changeCard = cardArray[randomIndex]
                cardArray[randomIndex] = cardArray[i]
                cardArray[i] = changeCard
            }
        }
    }
    
    mutating func removeOne() -> Card{
        let cardBeDeleted = cardArray.remove(at: Int((0..<cardArray.count).randomElement()!))
        return cardBeDeleted
    }
    
    mutating func reset(){
        cardArray.removeAll()
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                let card = Card(shape: shape, number: number)
                cardArray.append(card)
            }
        }
    }
    
    mutating func count() -> Int{
        return cardArray.count
    }
    
    func ReturnCardArray() -> [Card]{
        return cardArray
    }
}

var cardDeck = CardDeck()

