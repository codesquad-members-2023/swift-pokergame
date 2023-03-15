//
//  CardDeck.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/15.
//
import Foundation

struct CardDeck{
    
    var cardArray : [Card]
    
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
        // 전체 카드를 랜덤하게 섞는다.
        // Fisher-Yates 사용
        for i in 0..<cardArray.count {
            if let randomIndex = (i+1..<cardArray.count).randomElement() {
                let changeCard = cardArray[randomIndex]
                cardArray[randomIndex] = cardArray[i]
                cardArray[i] = changeCard
            }
        }
    }
    
    mutating func removeOne() -> Card{
        //카드 인스턴스 중에 하나를 반환하고 목록에서 삭제
        let cardBeDeleted = cardArray.remove(at: Int((0..<cardArray.count).randomElement()!))
        return cardBeDeleted
    }
    
    mutating func reset(){
        //처음처럼 모든 카드를 다시 채워넣는다.
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
}

var cardDeck = CardDeck()

