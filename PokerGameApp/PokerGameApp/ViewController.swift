import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "backgroundImage") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        let cardWidth = UIScreen.main.bounds.size.width / 7 - 3
        let cardImage = UIImage(named: "card-back")
        for i in 0..<7 {
            let card = UIImageView(image: cardImage)
            card.frame = CGRect(x: 2.6 + CGFloat(i)*(cardWidth + 2.6), y: 54,
                                width: cardWidth, height: cardWidth * 1.27)
            // 카드간 간격인 2.6은 임의로 설정한 값입니다.
            // y값은 아래 문서에서 발췌한 IPhone 14의 Safe Area 높이입니다.
            // https://useyourloaf.com/blog/iphone-14-screen-sizes/
            self.view.addSubview(card)
        }
    }
}


