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
}
