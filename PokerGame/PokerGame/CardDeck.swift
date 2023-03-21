//
//  CardDeck.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/15.
//
import Foundation

class CardDeck{
    
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
    
    func shuffle() {
        for i in 0..<stackCards.count {
            if let randomIndex = (i+1..<stackCards.count).randomElement() {
                let changeCard = stackCards[randomIndex]
                stackCards[randomIndex] = stackCards[i]
                stackCards[i] = changeCard
            }
        }
    }
    
    func removeOne() -> Card{
        if stackCards.count == 0{
            print("---------------------")
            print("카드 부족. 어플을 종료합니다.")
            exit(0)
        }else{
            return stackCards.removeLast()
        }
    }
    
    func reset(){
        stackCards.removeAll()
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                let card = Card(shape: shape, number: number)
                stackCards.append(card)
            }
        }
    }
    
    func count() -> Int{
        return stackCards.count
    }
    
    func ReturnStackCards() -> [Card]{
        return stackCards
    }
}


