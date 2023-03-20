//
//  Card.swift
//  PokerGameApp
//
//  Created by apple on 2023/03/16.
//

import Foundation


class Card: CustomStringConvertible {
    /// shape, number는 정해진 값을 담고 있기에 enum을 사용하는것이 편할거라 생각
    
    enum Shape: Character, CaseIterable, CustomStringConvertible {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    enum Number: Int, CaseIterable, CustomStringConvertible {
        case ace=1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
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
    
    let shape: Shape
    let number: Number
    
    init(number: Number, shape: Shape) {
        self.shape = shape
        self.number = number
    }
    
    static func getAllShape() -> [Shape] {
        return Shape.allCases
    }
    
    static func getAllNumber() -> [Number] {
        return Number.allCases
    }
    
    var description: String {
        return "\(shape)\(number)"
    }
}

