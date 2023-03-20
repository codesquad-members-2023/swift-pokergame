//
//  PokerBoardViewController.swift
//  PokerGameApp
//
//  Created by Noah on 2023/03/16.
//

import UIKit

final class PokerBoardViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        guard let pokerBoardBackground = ImageAsset.load(from: .pokerBoard)
        else {
            self.view.backgroundColor = UIColor.black
            return
        }
        self.view.backgroundColor = UIColor(patternImage: pokerBoardBackground)
    }
}
