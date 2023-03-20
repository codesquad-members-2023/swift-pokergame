//
//  Participant.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class Participant : Player {
    var name : String
    
    override init(){
        self.name = ""
        super.init()
    }
}
