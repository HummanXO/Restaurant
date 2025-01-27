import UIKit

class BillViewController: UIViewController {
    
    var pizzaName = ""
    var cheese: Bool = false
    var vetchina: Bool = false
    var mashroom: Bool = false
    var olives: Bool = false
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let cheeseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let vetchinaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let mashroomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let olivesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let cashLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let cashSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .systemBlue
        switchControl.isOn = true
        return switchControl
    }()
    
    private let cardLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let cardSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .systemBlue
        return switchControl
    }()
    
    private let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pay", for: .normal)
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "Bill"
        view.backgroundColor = .white
        setupUI()
        setupAction()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(pizzaNameLabel)
        
        titleLabel.text = "Ваш заказ:"
        pizzaNameLabel.text = "Пицца: \(pizzaName)"
        
        // Установим titleLabel и pizzaNameLabel констрейнты
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pizzaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            pizzaNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            pizzaNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    
        var ingredientLabels: [UILabel] = []
        
        if cheese {
            cheeseLabel.text = "Сыр: Да"
            ingredientLabels.append(cheeseLabel)
        }
        if vetchina {
            vetchinaLabel.text = "Ветчина: Да"
            ingredientLabels.append(vetchinaLabel)
        }
        if mashroom {
            mashroomLabel.text = "Грибы: Да"
            ingredientLabels.append(mashroomLabel)
        }
        if olives {
            olivesLabel.text = "Оливки: Да"
            ingredientLabels.append(olivesLabel)
        }
        
        var previousLabel: UILabel = pizzaNameLabel
        for label in ingredientLabels {
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
            previousLabel = label
        }
        
        view.addSubview(cashLabel)
        view.addSubview(cashSwitch)
        view.addSubview(cardLabel)
        view.addSubview(cardSwitch)
        
        cashLabel.text = "Наличные"
        cardLabel.text = "Карта"
        
        cashLabel.translatesAutoresizingMaskIntoConstraints = false
        cashSwitch.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        cardSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Cash label and switch
            cashLabel.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 20),
            cashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cashSwitch.centerYAnchor.constraint(equalTo: cashLabel.centerYAnchor),
            cashSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Card label and switch
            cardLabel.topAnchor.constraint(equalTo: cashLabel.bottomAnchor, constant: 20),
            cardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cardSwitch.centerYAnchor.constraint(equalTo: cardLabel.centerYAnchor),
            cardSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        payButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            payButton.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 20),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupAction() {
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        cardSwitch.addTarget(self, action: #selector(cardSwitchToggled), for: .valueChanged)
        cashSwitch.addTarget(self, action: #selector(cashSwitchToggled), for: .valueChanged)
    }
    
    @objc private func payButtonTapped() {
        let foodVC = FoodViewController()
        let alertController = UIAlertController(title: "Thank you!", message: "Your payment has been received.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.pushViewController(foodVC, animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    @objc private func cashSwitchToggled(_ sender: UISwitch) {
        if sender.isOn {
            cardSwitch.setOn(false, animated: true)
        }
    }

    @objc private func cardSwitchToggled(_ sender: UISwitch) {
        if sender.isOn {
            cashSwitch.setOn(false, animated: true)
        }
    }

}
