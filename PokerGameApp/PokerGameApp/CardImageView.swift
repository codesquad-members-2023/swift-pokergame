//
//  CardImageView.swift
//  PokerGameApp
//
//  Created by Noah on 2023/03/20.
//

import UIKit

final class CardImageView: UIImageView {
    
    private let heightScaleRatio: CGFloat = 1.27
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(image: UIImage?, width: CGFloat, origin: CGPoint) {
        self.init(image: image)
        let size = CGSize(
            width: width,
            height: width * self.heightScaleRatio
        )
        self.frame = CGRect(origin: origin, size: size)
        self.contentMode = .scaleAspectFit
    }
}
