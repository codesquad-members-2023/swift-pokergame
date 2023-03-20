//
//  ViewController.swift
//  PokerGameApp
//
//  Created by PJB on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setCardBack(cardCount: 7)
    }
    private func setBackground() {
        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    private func setCardBack(cardCount: Int) {
        var positionX: CGFloat = 2.5
        let positionY: CGFloat = 59
        let spacing: CGFloat = 2.5
        let spaceCount: CGFloat = 8
        let ratio: CGFloat = 1.27
        let cardWidth: CGFloat = (self.view.bounds.width - spacing * spaceCount) / CGFloat(cardCount)
        let cardHeight = cardWidth * ratio
        let image = UIImage(named: "card-back")
        
        for _ in 1...cardCount {
            let cardImageView = UIImageView(image: image)
            cardImageView.frame = CGRect(x: positionX, y: positionY, width: cardWidth, height: cardHeight)
            cardImageView.contentMode = .scaleAspectFit
            view.addSubview(cardImageView)
            positionX += cardWidth + spacing
        }
    }
}
