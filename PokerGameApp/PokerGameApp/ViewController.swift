//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  private func configure() {
    guard let pattermImage = UIImage(named: "bg_pattern") else { return }
    view.backgroundColor = .init(patternImage: pattermImage)
  }

}
