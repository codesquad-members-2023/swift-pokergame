//
//  Card.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/15.
//

import Foundation

struct Card { // 포커에 있어서 더이상 확장할 필요가 없는 객체라고 생각한 것이 가장 큰 이유.
    enum Shape : Character {
        // 같은 주제로 연관된 데이터의 집합
        // 입력받을 값을 미리 특정할 수 있기에 Enum이 적합하다고 생각.
        case spade = "♠︎" , heart = "♥︎" , diamond = "♦︎" , clover = "♣︎"
    }
    enum Rank : Int { // 나중에 승패를 가르기 위해서는 Integer의 비교가 필요하므로 Int형
        case ace = 1 , two = 2 , three = 3 , four = 4 , five = 5 , six = 6 , seven = 7, eight = 8, nine = 9,
             ten = 10, jack = 11, queen = 12, king = 13
        
        func description() -> String {
            switch self{
            case .ace :
                return "A"
            case .two :
                return "2"
            case .three :
                return "3"
            case .four :
                return "4"
            case .five :
                return "5"
            case .six :
                return "6"
            case .seven :
                return "7"
            case .eight :
                return "8"
            case .nine :
                return "9"
            case .ten :
                return "10"
            case .jack :
                return "J"
            case .queen :
                return "Q"
            case .king :
                return "K"
            }
        }
    }
    
    let shape : Shape
    let rank : Rank
    
}

extension Card: CustomStringConvertible {
    var description : String {
        return "\(self.shape.rawValue)\(self.rank.description())"
    }
}
