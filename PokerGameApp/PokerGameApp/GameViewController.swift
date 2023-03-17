import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(imageName: "backgroundImage")
        
        let interval = CGFloat(2.6)
        let positionY = CGFloat(59)
        let count = CGFloat(7)
        let totalInterval = interval * count
        let width = (UIScreen.main.bounds.size.width - totalInterval) / count
        for i in 0..<7 {
            let cardUI = makeCardUI(x: interval + (interval + width) * CGFloat(i), y: positionY)
        }
    }
    
    private func setBackground(imageName: String) {
        if let image = UIImage(named: imageName) {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    private func makeCardUI(x:CGFloat, y:CGFloat) -> UIImageView {
        var cardUI = UIImageView()
        if let deck = UIImage(named: "card-back") {
            cardUI = UIImageView(image: deck)
        }
        
        let width = UIScreen.main.bounds.size.width / 7 - 3
        let height = width * 1.27
        cardUI.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(cardUI)
        
        return cardUI
    }
}
