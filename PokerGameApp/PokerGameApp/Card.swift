//
//  Card.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/15.
//

import Foundation

class Card {
  /// 카드의 문양
  ///
  /// 카드 숫자의 타입과 일관성을 위해서 열거형으로 선언했습니다.
  enum Shape: Character {
    case spade = "\u{2660}"
    case clove = "\u{2663}"
    case heart = "\u{2665}"
    case diamond = "\u{2666}"
  }
  
  /// 카드의 숫자
  ///
  /// 카드 숫자는 경우가 많고, 그 경우의 수를 제한할 필요가 있어서 열거형으로 선언했습니다.
  enum Number: Int {
    case ace = 1,
         n2,
         n3,
         n4,
         n5,
         n6,
         n7,
         n8,
         n9,
         n10,
         jack,
         queen,
         king
    
    var symbol: String {
      switch self {
      case .ace: return "A"
      case .jack: return "J"
      case .queen: return "Q"
      case .king: return "K"
      default: return "\(rawValue)"
      }
    }
  }
  
  private let shape: Shape
  private let number: Number
  
  init(shape: Shape, number: Number) {
    self.number = number
    self.shape = shape
  }
  
  func info() -> String {
    "\(shape.rawValue)\(number.symbol)"
  }
}
