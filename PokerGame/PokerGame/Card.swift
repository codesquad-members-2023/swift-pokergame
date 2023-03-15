//
//  MakeCard.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/14.
//

import Foundation

class Card{
    //enum타입 한 이유 : 어짜피 모양은 4개중 하나, 넘버는 1~13중 하나라서
    var shape : Shape
    var number : Number
    lazy var imoticon: String = self.shape.rawValue

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
    
    enum Number : String, CaseIterable{
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
        case twelve = "Q"
        case thirteen = "K"
    }
    
    func description() -> String{
        return self.imoticon + self.number.rawValue
    }
}






