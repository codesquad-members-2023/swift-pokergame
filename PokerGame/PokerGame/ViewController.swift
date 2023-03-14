//
//  ViewController.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printCardImage()
    }
    
    func printCardImage() {
        guard let backgroundImage = UIImage(named: "bg_pattern")else {
            print("배경이미지 오류.")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        let cardBackImage = UIImage(named: "card-back")
        var cardLocateX: CGFloat = 2.5
        let cardLocateY: CGFloat = 60
        let ratio = 1.27
        let numberCards: CGFloat = 7
        let spacingCard: CGFloat = 5
        let cardWidth = (self.view.frame.width / numberCards)-spacingCard
        let cardHeight = cardWidth * ratio
        for _ in 1...7 {
            let cardImageView = UIImageView(image: cardBackImage)
            cardImageView.frame = CGRect(x: cardLocateX, y: cardLocateY, width: cardWidth, height: cardHeight)
            self.view.addSubview(cardImageView)
            cardLocateX += (cardWidth+spacingCard)
        }
    }
}



