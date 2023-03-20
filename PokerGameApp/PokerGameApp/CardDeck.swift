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
}
