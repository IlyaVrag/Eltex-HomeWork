import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let runButton = UIButton()
    let outputText = UITextView()
    let stack = UIStackView()
    let innerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupUI()
    }

    func setupUI() {
        titleLabel.frame = CGRect(x: 20, y: 80, width: 300, height: 40)
        titleLabel.text = "Lab4"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(titleLabel)
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 130, width: 100, height: 100)
        imageView.backgroundColor = .lightGray
        view.addSubview(imageView)
        innerView.frame = CGRect(x: 200, y: 130, width: 120, height: 80)
        innerView.backgroundColor = .green

        let saleLabel = UILabel()
        saleLabel.frame = CGRect(x: 10, y: 10, width: 100, height: 20)
        saleLabel.text = "SALE"
        saleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        innerView.addSubview(saleLabel)
        view.addSubview(innerView)

        stack.frame = CGRect(x: 20, y: 260, width: 300, height: 50)
        stack.axis = .horizontal
        stack.spacing = 10

        let item1 = UILabel()
        item1.text = "Item 1"
        item1.backgroundColor = .systemGray5
        item1.textAlignment = .center

        let item2 = UILabel()
        item2.text = "Item 2"
        item2.backgroundColor = .systemGray5
        item2.textAlignment = .center

        stack.addArrangedSubview(item1)
        stack.addArrangedSubview(item2)

        view.addSubview(stack)

        outputText.frame = CGRect(x: 20, y: 330, width: 330, height: 150)
        outputText.isEditable = false
        outputText.layer.borderWidth = 1
        outputText.layer.borderColor = UIColor.gray.cgColor

        view.addSubview(outputText)
        runButton.frame = CGRect(x: 20, y: 500, width: 200, height: 50)
        runButton.setTitle("Run", for: .normal)
        runButton.backgroundColor = .systemBlue
        runButton.layer.cornerRadius = 10

        runButton.addTarget(self, action: #selector(runTapped), for: .touchUpInside)

        view.addSubview(runButton)
    }

    @objc func runTapped() {

        outputText.text = """
         Bot started
        """
    }
}
