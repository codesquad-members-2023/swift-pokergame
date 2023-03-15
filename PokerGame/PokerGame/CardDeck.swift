//
//  CardDeck.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/15.
//
import Foundation

struct CardDeck{
    
    private var stackCards : [Card]
    
    init() {
        stackCards = []
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                let card = Card(shape: shape, number: number)
                stackCards.append(card)
            }
        }
    }
    
    mutating func shuffle() {
        for i in 0..<stackCards.count {
            if let randomIndex = (i+1..<stackCards.count).randomElement() {
                let changeCard = stackCards[randomIndex]
                stackCards[randomIndex] = stackCards[i]
                stackCards[i] = changeCard
            }
        }
    }
    
    mutating func removeOne() -> Card{
        if stackCards.count == 1{
            print("마지막 카드입니다.")
            return stackCards.removeLast()
        }else if stackCards.count == 0{
            print("카드 부족. 어플을 종료합니다.")
            exit(0)
        }else{
            return stackCards.removeLast()
        }
    }
    
    mutating func reset(){
        stackCards.removeAll()
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                let card = Card(shape: shape, number: number)
                stackCards.append(card)
            }
        }
    }
    
    mutating func count() -> Int{
        return stackCards.count
    }
    
    func ReturnCardArray() -> [Card]{
        return stackCards
    }
}
