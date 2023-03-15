//
//  Card.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/15.
//

import Foundation

class Card {
    private let shape: Shape
    private let rank: Rank
    
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    func returnShape() -> String { shape.rawValue }
    func returnRank() -> String { rank.rawValue }
}

// Shape, Rank에는 값이 한정되어 있으므로 enum이 적절하다고 판단했습니다. 또 Rank의 경우에서 one, eleven, tweleve, thirteen에서 숫자가 아닌 문자로 표현하는 데에 있어 enum의 rawValue를 활용하는 것이 적절하다고 생각했습니다.

enum Shape: String {
    case Space = "♠️"
    case Clover = "♣️"
    case Diamond = "♦️"
    case Heart = "♥️"
}

enum Rank: String {
    case one = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "J"
    case tweleve = "Q"
    case thirteen = "K"
}
