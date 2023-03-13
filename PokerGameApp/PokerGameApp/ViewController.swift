//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
  
  private let safeAreaSideMargin = CGFloat(16)
  
  private let cardImage = UIImage(named: "card-back")

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addCards(7, withInset: 1.0)
  }
  
  private func configure() {
    guard let pattermImage = UIImage(named: "bg_pattern") else { return }
    view.backgroundColor = .init(patternImage: pattermImage)
  }
  
  private func addCards(_ count: Int, withInset insetWidth: CGFloat) {
    let cardWidth = (view.frame.width - safeAreaSideMargin * 2 - (insetWidth * CGFloat(count + 1))) / CGFloat(count)
    let cardHeight = cardWidth * CGFloat(1.27)
    
    var cardViews = Array<UIImageView>()
    
    for i in 0..<count {
      let cardImageView = UIImageView(image: cardImage)
      cardViews.append(cardImageView)
      
      view.addSubview(cardImageView)
      cardImageView.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
        cardImageView.widthAnchor.constraint(equalToConstant: cardWidth),
        cardImageView.heightAnchor.constraint(equalToConstant: cardHeight),
        cardImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      ])
      
      if i == 0 {
        cardImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeAreaSideMargin).isActive = true
      } else {
        let previousCard = cardViews[i - 1]
        cardImageView.leadingAnchor.constraint(equalTo: previousCard.trailingAnchor, constant: insetWidth).isActive = true
      }
    }
  }

}


