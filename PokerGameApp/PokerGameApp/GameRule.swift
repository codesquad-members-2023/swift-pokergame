//
//  GameRule.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/29.
//

import Foundation

enum Stud: Int {
    case fiveStud, sevenStud
    
    func setNumberOfCards() -> Int {
        switch self {
        case .fiveStud :
            return 5
        case .sevenStud :
            return 7
        }
    }
}

enum NumberOfPlayers: Int, CaseIterable {
    case one = 1, two, three, four
    
    func setNumberOfPlayers() -> Int {
        switch self {
        default :
            return self.rawValue
        }
    }
}
