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
        
        self.setBackground(to: "backGround")
        self.setCard(num: 7)
    }
    
    func setBackground(to:String) {
        /// 배경 이미지 변경
        let backgroundImage = UIImage(named: to)
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    func setCard(num: Int) {
        /// 입력한 카드 갯수만큼 카드 생성
        let screenSize = self.view.bounds
        
        let cardWidth = screenSize.width / CGFloat(num)
        let cardHeight = cardWidth * 1.27
        let cardSpacing = cardWidth * 0.2
        
        for i in 0..<num {
            let x = CGFloat(i) * cardWidth + cardWidth * 0.1
            let frame = CGRect(x: x, y: 80, width: cardWidth*0.8, height: cardHeight)

            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: "backCard")

            self.view.addSubview(imageView)
        }
    }
}

