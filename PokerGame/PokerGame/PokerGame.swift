//
//  PokerGame.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class PokerGame {
    weak var dealer: Dealer?
    var players: [Player] = []
    var gameStyle: GameStyle = .FiveCardStud
    
    func toggleGameStyle() {
        if gameStyle == .FiveCardStud {
            gameStyle = .SevenCardStud
        } else {
            gameStyle = .FiveCardStud
        }
    }
    
    func addPlayer(_ count: Int) {
        var count = count
        if count > 5 { count = 4 }
        
        for _ in 0..<count {
            players.append(Player())
        }
    }
    
    func startGame(playerCount: Int) {
        addPlayer(playerCount)
        dealer?.startGame()
    }
    
    func endGame() {
        // 게임이 끝날 때 해야할 작업
    }
}

enum GameStyle: Int {
    case FiveCardStud = 5
    case SevenCardStud = 7
}
