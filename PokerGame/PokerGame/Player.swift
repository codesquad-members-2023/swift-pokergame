//
//  Player.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class Player {
    let name: String
    private var cards: [Card]
    
    init() {
        name = Player.generateRandomName()
        cards = []
    }
    
    func getCard(_ card: Card) {
        cards.append(card)
    }
}

extension Player {
    static var availableNames: [String] = ["crong", "honux", "jk", "하림", "haena", "effie", "wood", "Aiden", "Noah", "울버린", "에디"].shuffled()
    
    private static func generateRandomName() -> String {
        Player.availableNames.popLast() ?? "Unnamed"
    }
}
