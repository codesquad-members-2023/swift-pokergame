//
//  ViewController.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackgroundView()
        let interval = 4
        let cardWidth = self.view.bounds.width/7 - 3.4
        for i in 0...6 {
            let cardImage = makeCardView(posX: Int(interval) + (Int(interval) + Int(cardWidth)) * i)
            self.view.addSubview(cardImage)
        }
    }
    
    func makeBackgroundView() {
        guard let backgroundImage = UIImage(named: "background") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    func makeCardView(posX: Int) -> UIImageView {
        let width: CGFloat = self.view.bounds.width/7 - 3.4
        let height: CGFloat = width * 1.27
        let posY: CGFloat = 55
        
        let imageView = UIImageView(frame: CGRect(x: CGFloat(posX), y: posY, width: width, height: height))
        let myImage: UIImage = UIImage(named: "card_back")!
        imageView.image = myImage
        return imageView
    }
}

