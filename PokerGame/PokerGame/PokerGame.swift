//
//  PokerGame.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class PokerGame {
    var dealer: Dealer
    var players: [Player]
    var gameStyle: GameStyle
    
    init() {
        dealer = Dealer()
        players = []
        gameStyle = .FiveCardStud
        dealer.pokerGameDelegate = self
    }
    
    func toggleGameStyle() {
        if gameStyle == .FiveCardStud {
            gameStyle = .SevenCardStud
        } else {
            gameStyle = .FiveCardStud
        }
    }
    
    func configurePlayer(_ count: Int) {
        var count = count
        if count > 4 { count = 4 }
        
        players = []
        for _ in 0..<count {
            players.append(Player())
        }
    }
    
    func startGame() {
        dealer.startGame()
    }
    
    func startGame(with playerCount: Int) {
        configurePlayer(playerCount)
        dealer.startGame()
    }
    
    func endGame() {
        removeDealtCards()
    }
    
    func removeDealtCards() {
        for player in players {
            player.removeCards()
        }
    }
}

enum GameStyle: Int {
    case FiveCardStud = 5
    case SevenCardStud = 7
}
