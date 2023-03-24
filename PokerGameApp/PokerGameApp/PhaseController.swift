//
//  GameController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/22.
//

import Foundation

class PhaseController  {
    
    func dealPhase( mode : GameSetting.Mode , numberOfParticipant : Int ) -> [Player] {
        let gameSetting = GameSetting(mode, numberOfParticipant)
        gameSetting.setPlayer() // 참가자 numberOfParticipant명과 딜러 1명으로 구성된 playerList를 만든다.
        
        let dealer : Dealer = gameSetting.playerList[numberOfParticipant] as! Dealer // playerList: [Player] 의 마지막 인덱스에 Dealer가 위치한다.
        dealer.work()
        
        return gameSetting.playerList
    }
    
}
