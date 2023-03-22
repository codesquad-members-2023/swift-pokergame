//
//  GameSetting.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class GameSetting {
    enum Mode {
        case fiveStud
        case sevenStud
     
        func numberOfCard() -> Int {
            switch self {
            case .fiveStud :
                return 5
            case .sevenStud :
                return 7
            }
        }
    }
    let mode : Mode
    let numberOfParticipant : Int
    var playerList : [Player]
    
    init(_ mode : Mode , _ numberOfParticipant : Int){
        self.mode = mode
        self.numberOfParticipant = numberOfParticipant
        self.playerList = []
        self.isValidNumberOfPlayer(self.numberOfParticipant)
    }
    
    func setPlayer () {
        for _ in 0...numberOfParticipant-1 {
            self.playerList.append(Participant())
        }
        self.playerList.append(Dealer(Deck()))
        
    }
    
    func isValidNumberOfPlayer(_ num : Int){
        guard num >= 1 else {
            exit(0)
        }
    }
}
