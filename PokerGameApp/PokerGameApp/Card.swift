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
  enum Shape: CustomStringConvertible {
    case spade
    case clove
    case heart
    case diamond
    
    var description: String {
      switch self {
      case .spade: return "\u{2660}"
      case .clove: return "\u{2663}"
      case .heart: return "\u{2665}"
      case .diamond: return "\u{2666}"
      }
    }
  }
  
  /// 카드의 숫자
  ///
  /// 카드 숫자는 경우가 많고, 그 경우의 수를 제한할 필요가 있어서 열거형으로 선언했습니다.
  enum Number: Int, CustomStringConvertible {
    case ace,
         two,
         three,
         four,
         five,
         six,
         seven,
         eight,
         nine,
         ten,
         jack,
         queen,
         king
    
    var description: String {
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
    "\(shape.description)\(number.description)"
  }
}
