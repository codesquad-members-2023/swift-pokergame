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
    }
    
    func setBackground () {
        var backgroundPattern : UIImage? = UIImage(named: "bg_pattern")
        
        guard let pattern = backgroundPattern else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: pattern)
    }
    

}

