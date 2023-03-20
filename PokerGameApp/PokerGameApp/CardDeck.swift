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
    
    
}
