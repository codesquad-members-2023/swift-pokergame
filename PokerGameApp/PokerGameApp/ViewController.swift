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
        
        let backgroundImage = UIImage(named: "backGround")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
}

