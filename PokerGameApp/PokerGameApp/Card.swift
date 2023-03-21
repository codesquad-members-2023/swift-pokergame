//
//  Card.swift
//  PokerGameApp
//
//  Created by PJB on 2023/03/20.
//

import Foundation

struct Card {
    // struct로 구현한 이유는 포커를 구현하는데, Card는 상속이 필요 없다고 생각했습니다
    
    // Enum을 사용한 이유는 서로 연관된 데이터라고 생각했습니다
    // 그리고 카드의 경우 문양과 숫자의 갯수가 정해져있고, 이미 정해놓은 입력값만 받고 싶기 때문에 Enum을 사용하였습니다
    enum Suit: Character, CustomStringConvertible {
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    enum Rank: Int, CustomStringConvertible {
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
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
    }
    private var suit: Suit
    private var rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit)\(rank)"
    }
}
