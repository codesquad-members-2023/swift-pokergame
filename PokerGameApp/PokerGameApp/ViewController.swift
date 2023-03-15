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
        guard let backgroundImage = UIImage(named: "background") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
}

