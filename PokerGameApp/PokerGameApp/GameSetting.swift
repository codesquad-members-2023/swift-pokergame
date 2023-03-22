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
    let numberOfPlayer : Int
    var playerList : [Player]
    
    init(_ mode : Mode , _ numberOfPlayer : Int){
        self.mode = mode
        self.numberOfPlayer = numberOfPlayer
        self.playerList = []
        self.isValidNumberOfPlayer(self.numberOfPlayer)
    }
    
    func setPlayer () {
        for _ in 0...numberOfPlayer-1 {
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
