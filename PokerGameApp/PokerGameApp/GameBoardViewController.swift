//
//  ViewController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/13.
//

import UIKit

class GameBoardViewController: UIViewController {

    var backgroundPattern : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundPattern = UIImage(named: "bg_pattern")
        setBackground()
    }
    
    func setBackground () {
        if let pattern = self.backgroundPattern {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }else {
            print("nil")
        }
    }
}

