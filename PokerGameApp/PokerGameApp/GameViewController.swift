import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(imageName: "backgroundImage")
        
        let cardInterval = CGFloat(2.6)
        let cardPositionY = CGFloat(54)
        let cardWidth = UIScreen.main.bounds.size.width / 7 - 3
        let cardPatternWidth = cardWidth + cardInterval
        for i in 0..<7 {
            let cardUI = makeCardUI(x: cardInterval + (cardInterval + cardWidth) * CGFloat(i), y: cardPositionY)
            self.view.addSubview(cardUI)
        }
    }
    
    func setBackground(imageName: String) {
        if let image = UIImage(named: imageName) {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func makeCardUI(x:CGFloat, y:CGFloat) -> UIImageView {
        var cardUI = UIImageView()
        if let deck = UIImage(named: "card-back") {
            cardUI = UIImageView(image: deck)
        }
        
        let width = UIScreen.main.bounds.size.width / 7 - 3
        let height = width * 1.27
        cardUI.frame = CGRect(x: x, y: y, width: width, height: height)
        return cardUI
    }
}
