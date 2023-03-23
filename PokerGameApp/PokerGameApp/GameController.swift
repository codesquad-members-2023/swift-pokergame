//
//  GameController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/22.
//

import Foundation

class GameController  {
    
    func run( mode : GameSetting.Mode , numberOfParticipant : Int ) {
        let gameSetting = GameSetting(mode, numberOfParticipant)
        gameSetting.setPlayer()
        
        let dealer : Dealer = gameSetting.playerList[numberOfParticipant] as! Dealer
        dealer.work()
        
        for player in gameSetting.playerList {
            print(player)
        }
    }
}
