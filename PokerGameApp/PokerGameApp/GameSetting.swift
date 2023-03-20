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
    let playerList : [Player]
    
    init(_ mode : Mode ){
        self.mode = mode
        self.numberOfPlayer = 0
        self.playerList = []
    }
    
    func setPlayer () {
        
    }
    
    func setNumberOfPlayer() {
        
    }
}
