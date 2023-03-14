import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "backgroundImage") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        let cardImage = UIImage(named: "card-back")
        let cardInterval = CGFloat(2.6)
        let cardWidth = UIScreen.main.bounds.size.width / 7 - 3
        let cardPatternWidth = cardWidth + cardInterval
        let cardPositionY = CGFloat(54)
        let cardHeight = cardWidth * 1.27
        for i in 0..<7 {
            let card = UIImageView(image: cardImage)
            card.frame = CGRect(x: cardInterval + CGFloat(i)*(cardPatternWidth),
                                y: cardPositionY, width: cardWidth, height: cardHeight)
            self.view.addSubview(card)
        }
    }
}
