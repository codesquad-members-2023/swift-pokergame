//
//  ImageAsset.swift
//  PokerGameApp
//
//  Created by Noah on 2023/03/16.
//

import UIKit.UIImage

enum ImageAsset: String {
    case pokerBoard = "PokerBoard"
    case cardBack = "CardBack"
}

extension ImageAsset {
    static func load(from imageAsset: ImageAsset) -> UIImage? {
        return UIImage(named: imageAsset.rawValue)
    }
}
