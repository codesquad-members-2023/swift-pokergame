//
//  MakeCard.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/14.
//

import Foundation

struct Card: CustomStringConvertible{
    
    //enum타입 한 이유 : 어짜피 모양은 4개중 하나, 넘버는 1~13중 하나라서
    var shape : Shape
    var number : Number
    var description: String{
        switch self.number {
        case .one :
            return self.shape.rawValue + "A"
        case .eleven :
            return self.shape.rawValue + "J"
        case .twelve :
            return self.shape.rawValue + "Q"
        case .thirteen :
            return self.shape.rawValue + "K"
        default :
            return self.shape.rawValue + String(self.number.rawValue)
        }
    }
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
    
    enum Shape : String, CaseIterable{
        case heart = "❤️"
        case spade = "♠️"
        case clover = "♣️"
        case diamond = "◆"
    }
    
    enum Number : Int, CaseIterable{
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
        case thirteen
    }
}






