import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    var imageView: UIImageView!
    var saleLabel: UILabel!
    var innerView: UIView!
    var stackView: UIStackView!
    var item1Label: UILabel!
    var item2Label: UILabel!
    var item3Label: UILabel!
    var outputTextView: UITextView!
    var runButton: UIButton!
    var emptyStateLabel: UILabel!
    var isDataLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createUIElements()
        
        addUIElementsToView()
        
        setupConstraints()
        
        runButton.addTarget(self, action: #selector(runBotTapped), for: .touchUpInside)
        updateEmptyState()
    }
    
    func createUIElements() {
        titleLabel = UILabel()
        titleLabel.text = "Lab5 Торговый бот"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        innerView = UIView()
        innerView.backgroundColor = .systemGreen
        innerView.layer.cornerRadius = 12
        innerView.translatesAutoresizingMaskIntoConstraints = false
        
        saleLabel = UILabel()
        saleLabel.text = "SALE 50%"
        saleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        saleLabel.textColor = .white
        saleLabel.backgroundColor = .systemRed
        saleLabel.textAlignment = .center
        saleLabel.layer.cornerRadius = 8
        saleLabel.clipsToBounds = true
        saleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        item1Label = UILabel()
        item1Label.text = "BTC/USDT"
        item1Label.backgroundColor = .systemGray5
        item1Label.textAlignment = .center
        item1Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        item1Label.layer.cornerRadius = 8
        item1Label.clipsToBounds = true
        
        item2Label = UILabel()
        item2Label.text = "ETH/USDT"
        item2Label.backgroundColor = .systemGray5
        item2Label.textAlignment = .center
        item2Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        item2Label.layer.cornerRadius = 8
        item2Label.clipsToBounds = true
        
        item3Label = UILabel()
        item3Label.text = "SOL/USDT"
        item3Label.backgroundColor = .systemGray5
        item3Label.textAlignment = .center
        item3Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        item3Label.layer.cornerRadius = 8
        item3Label.clipsToBounds = true

        outputTextView = UITextView()
        outputTextView.isEditable = false
        outputTextView.layer.borderWidth = 1
        outputTextView.layer.borderColor = UIColor.systemGray4.cgColor
        outputTextView.layer.cornerRadius = 12
        outputTextView.font = UIFont.systemFont(ofSize: 14)
        outputTextView.translatesAutoresizingMaskIntoConstraints = false

        runButton = UIButton(type: .system)
        runButton.setTitle("Запустить бота", for: .normal)
        runButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        runButton.backgroundColor = .systemBlue
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = 12
        runButton.translatesAutoresizingMaskIntoConstraints = false

        emptyStateLabel = UILabel()
        emptyStateLabel.text = "Нет данных\nИстория сделок будет отображаться тут"
        emptyStateLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        emptyStateLabel.textColor = .systemGray
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.numberOfLines = 0
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyStateLabel.isHidden = false
    }
    
    func addUIElementsToView() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(innerView)
        innerView.addSubview(saleLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(item1Label)
        stackView.addArrangedSubview(item2Label)
        stackView.addArrangedSubview(item3Label)
        view.addSubview(outputTextView)
        view.addSubview(runButton)
        view.addSubview(emptyStateLabel)
    }
    
    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        innerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        innerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        innerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        innerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        saleLabel.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
        saleLabel.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true
        saleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        saleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        outputTextView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        outputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        outputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        outputTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        runButton.topAnchor.constraint(equalTo: outputTextView.bottomAnchor, constant: 20).isActive = true
        runButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        runButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        runButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emptyStateLabel.centerXAnchor.constraint(equalTo: outputTextView.centerXAnchor).isActive = true
        emptyStateLabel.centerYAnchor.constraint(equalTo: outputTextView.centerYAnchor).isActive = true
        emptyStateLabel.leadingAnchor.constraint(equalTo: outputTextView.leadingAnchor, constant: 20).isActive = true
        emptyStateLabel.trailingAnchor.constraint(equalTo: outputTextView.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func runBotTapped() {
        generateTradeHistory()
        isDataLoaded = true
        updateEmptyState()
    }
    
    func generateTradeHistory() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        
        var historyText = "=== ИСТОРИЯ СДЕЛОК ===\n"
        historyText += "Бот запущен: \(dateString)\n\n"
        
        historyText += "BUY  BTC | Цена: $42,500 | Объём: 0.15 BTC\n"
        historyText += "------------------------\n"
        historyText += "SELL ETH | Цена: $2,850  | Объём: 2.5 ETH\n"
        historyText += "------------------------\n"
        historyText += "BUY  SOL | Цена: $95.50  | Объём: 10 SOL\n"
        historyText += "------------------------\n"
        historyText += "BUY  BTC | Цена: $43,200 | Объём: 0.08 BTC\n"
        historyText += "------------------------\n"
        historyText += "SELL SOL | Цена: $98.20  | Объём: 5 SOL\n"
        historyText += "------------------------\n\n"
        historyText += "Итого: 5 сделок"
        
        outputTextView.text = historyText
    }
    
    func updateEmptyState() {
        if isDataLoaded {
            emptyStateLabel.isHidden = true
        } else {
            emptyStateLabel.isHidden = false
            outputTextView.text = ""
        }
    }
}
