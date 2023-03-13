import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "backgroundImage") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }
}

