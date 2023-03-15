//
//  Card.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/15.
//

import Foundation

struct Card { // 포커에 있어서 더이상 확장할 필요가 없는 객체라고 생각한 것이 가장 큰 이유.
    enum Shape : Character { // 같은 주제로 연관된 데이터의 집합이므로 Enum이 적합하다고 생각.
        case spade = “♠︎”
        case heart = “♥︎”
        case diamond = “♦︎”
        case clover = “♣︎”
    }
    enum Rank : Int { // 나중에 승패를 가르기 위해서는 Integer의 비교가 필요하므로 Int형
        case ace = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13
        
        func getString() -> String {
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
