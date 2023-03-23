//
//  Player.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class Player {
    private var hand : [Card]
    var point : Int = 0
    
    init() {
        self.hand = []
    }
    
    func addCardsToHand(_ cards: [Card]) {
        self.hand.append(contentsOf: cards)
    }
}

extension Player: CustomStringConvertible {
    var description : String {
        var result = ""
        for card in self.hand {
            result += card.description
            result += " "
        }
        return result
    }
}
