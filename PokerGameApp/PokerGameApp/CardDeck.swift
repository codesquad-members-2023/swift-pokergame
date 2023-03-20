//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/20.
//

import Foundation

struct CardDeck {
    private var cardList = [Card]()
    
    func count() {
        print("\n=> 총 \(cardList.count)장의 카드가 남아 있습니다.\n")
    }
    
    mutating func shuffle() { // Knuth Shuffle 구현
        print("> 카드 섞기 \n\(cardList.count)장의 카드를 섞었습니다.\n")
        for i in 0 ..< (cardList.count - 1) {
            let randomIndex = Int.random(in: i..<cardList.count)
            cardList.swapAt(i, randomIndex)
        }
        printCardList(cardList: cardList)
    }
    
    mutating func removeOne() {
        let element = cardList.randomElement()!
        print("> 카드 하나 뽑기\n= \(element.cardSuit.rawValue + element.cardRank.rawValue)\n")
        cardList = cardList.filter(){($0.cardSuit.rawValue != element.cardSuit.rawValue || $0.cardRank.rawValue != element.cardRank.rawValue)}
        printCardList(cardList: cardList)
    }
}
