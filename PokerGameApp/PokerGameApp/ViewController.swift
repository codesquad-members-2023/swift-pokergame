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
    private func setCardBack(cardCount: CGFloat) {
        var positionX: CGFloat = 2.5
        let positionY: CGFloat = 59
        let cardSpacing: CGFloat = 2.5
        let spaceCount: CGFloat = 8
        let ratio: CGFloat = 1.27
        let cardWidth: CGFloat = (self.view.bounds.width - cardSpacing * spaceCount) / cardCount
        let cardHeight = cardWidth * ratio
        let Image = UIImage(named: "card-back")
        
        for _ in 0...6 {
            let cardImageView = UIImageView(image: Image)
            cardImageView.frame = CGRect(x: positionX, y: positionY, width: cardWidth, height: cardHeight)
            cardImageView.contentMode = .scaleAspectFit
            view.addSubview(cardImageView)
            positionX += cardWidth + cardSpacing
        }
    }
}
