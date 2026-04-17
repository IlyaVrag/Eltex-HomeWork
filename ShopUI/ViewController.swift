import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Запущено")
    }

    @IBAction func runButtonTapped(_ sender: UIButton) {
        print("Кнопка run нажата")
    }
}
