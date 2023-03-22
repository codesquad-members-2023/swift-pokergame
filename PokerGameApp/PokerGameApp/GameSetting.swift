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
    
    init(_ mode : Mode ){
        self.mode = mode
        self.numberOfPlayer = 0
        self.playerList = []
    }
    
    func setPlayer () {
        for _ in 0...numberOfPlayer-1 {
            self.playerList.append(Participant())
        }
        self.playerList.append(Dealer(Deck()))    }
    
    func setNumberOfPlayer() {
        
    }
}
