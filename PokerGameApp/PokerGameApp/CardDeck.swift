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
            let randomIndex = Int.random(in: i ..< cardList.count)
            cardList.swapAt(i, randomIndex)
        }
        printCardList(cardList: cardList)
    }
    
    mutating func removeOne() {
        let index = cardList.count - 1
        print("> 카드 하나 뽑기\n= \(cardList[index].getSuit().rawValue + cardList[index].getRank().rawValue)\n")
        cardList.removeLast()
        printCardList(cardList: cardList)
    }
    
    mutating func reset() {
        print("> 카드 초기화 \n카드 전체를 초기화 했습니다.\n")
        if !cardList.isEmpty { cardList.removeAll() }
        for suit in Suits.allCases {
            for rank in Ranks.allCases {
                let card = Card(suit: suit, rank: rank)
                cardList.append(card)
            }
        }
        printCardList(cardList: cardList)
    }
    
    private func printCardList(cardList: Array<Card>) {
        print("> 카드 목록")
        for card in cardList {
            print(card.getSuit().rawValue + card.getRank().rawValue, terminator: " ")
        }
        count()
    }
}
