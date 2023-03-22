//
//  Card.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/15.
//

import Foundation

struct Card: Equatable, Hashable {
    let shape: Shape
    let rank: Rank
    
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
}

// Shape, Rank에는 값이 한정되어 있으므로 enum이 적절하다고 판단했습니다. 또 Rank의 경우에서 one, eleven, tweleve, thirteen에서 숫자가 아닌 문자로 표현하는 데에 있어 enum의 rawValue를 활용하는 것이 적절하다고 생각했습니다.

enum Shape: String, CaseIterable, Hashable {
    case Space = "♠️"
    case Clover = "♣️"
    case Diamond = "♦️"
    case Heart = "♥️"
}

enum Rank: Int, CaseIterable, Hashable {
    case two = 2
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

extension Card: CustomStringConvertible {
    var description: String {
        "\(shape.rawValue)\(rank.rawValue)"
    }
}
