//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by apple on 2023/03/20.
//

import Foundation


class CardDeck {
    private var deck: [Card] = []
    private var tempDeck: [Card] = []
    
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
        /// fisher–yates 방법으로 shuffle 구현
        /// 배열의 index를 순차적으로 진행한다(i).
        /// i 이후부터 배열의 길이값까지 중 랜덤값을 뽑는다(swapIndex).
        /// i와 swapIndex의 값을 바꾼다.
        for i in 0..<self.count() {
            let swapIndex:Int = Int.random(in: i..<self.count())
            self.deck.swapAt(i, swapIndex)
        }
    }
    
    func removeOne() -> Card {
        let tempCard:Card = self.deck.popLast()!
        self.tempDeck.append(tempCard)
        return tempCard
    }
    
    func reset() {
        
    }
}
