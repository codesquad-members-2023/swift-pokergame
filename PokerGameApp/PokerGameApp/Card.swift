//
//  Card.swift
//  PokerGameApp
//
//  Created by 김하림 on 2023/03/21.
//

import Foundation

class PokerCard: CustomStringConvertible {
    // 연관된 계층 구조를 깔끔하게 표현하기 위해서 nested Type 사용
    enum Suit: Character, CustomStringConvertible, CaseIterable {
        case spade = "♠"
        case heart = "♥"
        case diamond = "♦"
        case club = "♣"
        
        var description: String {
            switch self {
            case .spade:
                return "♠"
            case .heart:
                return "♥"
            case .diamond:
                return "♦"
            case .club:
                return "♣"
            }
        }
    }
    // 카드의 랭크는 추후 승패를 위해 비교해야 하니 Int Type 사용
    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
        
        var description: String {
            switch self {
            case.A:
                return "A"
            case.J:
                return "J"
            case.Q:
                return "Q"
            case.K:
                return "K"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    private var suit:Suit
    private var rank:Rank
    
    init(suit:Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
