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
}
