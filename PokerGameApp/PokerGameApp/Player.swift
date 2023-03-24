//
//  Player.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class Player {
    private var hand : [Card]
    var playerList : [Player]
    var point : Int = 0
    var name : String
    
    init() {
        self.hand = []
        self.playerList = []
        self.name = ""
    }
    
    func addCardsToHand(_ cards: [Card]) {
        self.hand.append(contentsOf: cards)
    }

    func isHavingProblemInHand5Stud() -> Bool {
        var allCardsInHandOfAllPlayer : [Card] = []
        
        for player in self.playerList {
            guard player.hand.count == 5 else {
                return true
            }
            allCardsInHandOfAllPlayer.append(contentsOf: player.hand)
        }
        
        guard allCardsInHandOfAllPlayer.count == Set<Card>(allCardsInHandOfAllPlayer).count else {
            return true
        }
        return false
    }
    
    func isHavingProblemInHand7Stud() -> Bool {
        var allCardsInHandOfAllPlayer : [Card] = []
        
        for player in self.playerList {
            guard player.hand.count == 7 else {
                return true
            }
            allCardsInHandOfAllPlayer.append(contentsOf: player.hand)
        }
        
        guard allCardsInHandOfAllPlayer.count == Set<Card>(allCardsInHandOfAllPlayer).count else {
            return true
        }
        return false
    }
}

extension Player: CustomStringConvertible {
    var description : String {
        var result = ""
        for card in self.hand {
            result += card.description
            result += " "
        }
        return "\(self.name) : " + result
    }
}
