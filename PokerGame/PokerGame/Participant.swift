//
//  Participant.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/16.
//

import Foundation

class Participant {
    var name: String?
    var haveCard: [Card] = []
    
    init(name: String?) {
        self.name = name
    }
}

class Dealer: Participant {
    //중복된거같은데 "딜러가 카드를 나눠줌" 문장때문에 딜러 클래스에도 removeOne메서드 구현
    func removeOne(cardDeck:CardDeck) -> Card{
        return cardDeck.removeOne()
    }
}
