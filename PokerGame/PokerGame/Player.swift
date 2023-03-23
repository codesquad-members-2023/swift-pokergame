//
//  Player.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class Player {
    let name: String
    var cards: [Card]
    
    init() {
        name = Player.generateRandomName()
        cards = []
    }
    
    func getCard(_ card: Card) {
        cards.append(card)
    }
}

extension Player {
    static var availableNames: [String] = ["crong", "honux", "jk", "하림", "haena", "effie", "wood", "Aiden", "Noah", "울버린", "에디"].shuffled()
    
    static func addNewName(_ newName: String) {
        guard check_if_string_is_composed_with_only_alphabet(newName) else { return }
        guard newName.count <= 5 || newName.count >= 2 else { return }
        
        availableNames.append(newName)
    }
    
    private static func check_if_string_is_composed_with_only_alphabet(_ string: String) -> Bool {
        // string이 "ABC"일 때, unicodeValues = [65, 66, 67]
        let unicodeValues: [UInt32] = string.unicodeScalars.map { $0.value }
        
        for unicodeValue in unicodeValues {
            // 알파벳 대문자, 소문자 unicode값 범위를 벗어나면 false를 리턴
            if !(unicodeValue >= 65 && unicodeValue <= 90 || unicodeValue >= 97 && unicodeValue <= 122) {
                return false
            }
        }
        return true
    }
    
    private static func generateRandomName() -> String {
        Player.availableNames.popLast() ?? "Unnamed"
    }
}
