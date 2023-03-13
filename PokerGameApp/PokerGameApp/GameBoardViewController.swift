//
//  ViewController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/13.
//

import UIKit

class GameBoardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setCardBack()
    }
    
    func setBackground () {
        var backgroundPattern : UIImage? = UIImage(named: "bg_pattern")
        
        guard let pattern = backgroundPattern else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: pattern)
    }
    
    func setCardBack () {
        var cardBack : UIImage? = UIImage(named: "card-back")
        
        guard let img = cardBack else {
            return
        }
        let boundaryWidth = self.view.bounds.width
        let cardWidth = boundaryWidth/7
        var posX = 0.0
        
        for _ in 0...6 {
            var cardBackView = UIImageView(image: img)
            cardBackView.frame = CGRect(x: posX+2.0 , y: 50, width: cardWidth-4.0, height: cardWidth * 1.25 )
            self.view.addSubview(cardBackView)
            posX += cardWidth
        }
        
    }
}

