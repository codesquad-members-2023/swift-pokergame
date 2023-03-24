//
//  Participant.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class Participant : Player {
    
    override init(){
        super.init()
        self.name = setRandomName()
    }
    
    private func setRandomName() -> String {
        var name = ""
        let nameLength = Int.random(in: 2...5)
        
        for _ in 1...nameLength {
            let randomOffset = UInt32.random(in: 0...25)
            let randomUnicodeScalar = UnicodeScalar("a").value + randomOffset
            guard let randomLetter = UnicodeScalar(randomUnicodeScalar) else {
                return ""
            }
            name += String(randomLetter)
        }
        return name
    }
}
