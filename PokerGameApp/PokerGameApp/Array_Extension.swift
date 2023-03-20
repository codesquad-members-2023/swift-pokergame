//
//  Array_Extension.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/20.
//

import Foundation

extension Array {
  mutating func myShuffle() {
    for i in (0..<count).reversed() {
      guard let randomIndex = (0...i).randomElement() else { break }
      swapAt(i, randomIndex)
    }
  }
  
  private var randomIndex: Int? {
    (0..<count).randomElement()
  }
  
  mutating func removeRandom() -> Element? {
    guard let randomIndex = self.randomIndex else { return nil }
    return self.remove(at: randomIndex)
  }
}
