//
//  PokerGame.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class PokerGame {
    weak var dealer: Dealer?
    var gameStyle: GameStyle = .FiveCardStud
    
    func toggleGameStyle() {
        if gameStyle == .FiveCardStud {
            gameStyle = .SevenCardStud
        } else {
            gameStyle = .FiveCardStud
        }
    }
}

enum GameStyle {
    case FiveCardStud
    case SevenCardStud
}
