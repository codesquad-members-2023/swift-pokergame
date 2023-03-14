//
//  ViewController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/13.
//

import UIKit

class GameBoardViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setCardBack()
    }
    
    func setBackground () {
        let backgroundPattern : UIImage? = UIImage(named: "bg_pattern")
        
        guard let pattern = backgroundPattern else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: pattern)
    }
    
    func setCardBack () {
        let cardBack : UIImage? = UIImage(named: "card-back")
        let boundaryWidth = self.view.bounds.width
        let cardWidth = boundaryWidth/7
        var posX = 0.0
        let posY = 50.0
        let padding = 2.0
        
        guard let img = cardBack else {
            return
        }
        
        for _ in 0...6 {
            let cardBackView = UIImageView(image: img)
            cardBackView.frame = CGRect(x: posX+padding , y: posY, width: cardWidth-(2*padding), height: cardWidth * 1.27 )
            self.view.addSubview(cardBackView)
            posX += cardWidth
        }
    }
}

