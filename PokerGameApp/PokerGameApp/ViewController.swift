//
//  ViewController.swift
//  PokerGameApp
//
//  Created by apple on 2023/03/16.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackground(toImage: "backGround")
        self.setCard(countOf: 7)
        
        testCardDeck()
    }
    
    func setBackground(toImage:String) {
        let backgroundImage = UIImage(named: toImage)
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    func setCard(countOf: Int) {
        let screenSize = self.view.bounds
        let cardWidthRatio = 0.8 /// 7등분한 사이즈에 차지할 카드의 가로 길이
        let cardSizeRatio = 1.27 /// 가로 길이에 대한 세로길이의 비율
        let margin = 0.1 /// 카드 사이 간격 비율
        
        let splitScreenSize = screenSize.width / CGFloat(countOf)
        let cardWidth = splitScreenSize * cardWidthRatio
        let cardHeight = splitScreenSize * cardSizeRatio
        let cardMargin = splitScreenSize * margin
        
        for i in 0..<countOf {
            let x = CGFloat(i) * splitScreenSize + cardMargin
            let frame = CGRect(x: x, y: 80, width: cardWidth, height: cardHeight)

            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: "backCard")

            self.view.addSubview(imageView)
        }
    }
    
    func cardPrint(card:Card) {
        print(card)
    }
}

