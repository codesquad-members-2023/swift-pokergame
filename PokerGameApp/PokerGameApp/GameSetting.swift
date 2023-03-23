//
//  GameSetting.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class GameSetting  {
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
        
        self.ValidNumberOfPlayer(self.numberOfParticipant)
        
    }
    
    func setPlayer () {
        for _ in 0..<numberOfParticipant {
            self.playerList.append(Participant())
        }
        
        self.playerList.append(Dealer(Deck(), self.mode))
        givePlayerListToPlayer()
    }
    
    private func ValidNumberOfPlayer(_ num : Int){
        guard num >= 1 else {
            exit(0)
        }
    }
    
    private func givePlayerListToPlayer() {
        for player in self.playerList {
            player.playerList = playerList
        }
    }
    
}
