//
//  ViewController.swift
//  PokerGameApp
//
//  Created by PJB on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    private func setBackground() {
        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}

