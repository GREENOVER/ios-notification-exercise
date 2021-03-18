import UIKit

class YellowViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bodyLable: UILabel!
    
    var titleText: String = ""
    var bodyText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLable.text = titleText
        bodyLable.text = bodyText
    }
}
