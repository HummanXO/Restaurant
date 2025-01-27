import UIKit

class IngridientsViewController: UIViewController {
    var index: Int = 0
    private let labelPizzaName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private let imagePizza: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let labelCheese: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Cheese"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    private let switchCheese: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = true
        return switchView
    }()
    private let labelVetchina: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Vetchina"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    private let switchVetchina: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        return switchView
    }()
    private let labelMashroom: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Mashroom"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    private let switchMashroom: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = true
        return switchView
    }()
    private let labelOlives: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Olives"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    private let switchOlives: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        return switchView
    }()
    private let enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Enter", for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupAction()
    }
    
    private func setupAction() {
        enterButton.addTarget(self, action: #selector(handleEnterButton), for: .touchUpInside)
    }
    
    private func setupLayout() {
        [labelPizzaName, imagePizza, labelCheese, switchCheese, labelVetchina, switchVetchina, labelMashroom,switchMashroom, labelOlives, switchOlives,enterButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        if index == 0 {
            labelPizzaName.text = "Margherita"
        } else if index == 1 {
            labelPizzaName.text = "Pepperoni"
        }
        
        NSLayoutConstraint.activate([
            labelPizzaName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelPizzaName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imagePizza.topAnchor.constraint(equalTo: labelPizzaName.bottomAnchor, constant: 20),
            imagePizza.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePizza.widthAnchor.constraint(equalToConstant: 200),
            imagePizza.heightAnchor.constraint(equalToConstant: 200),
            
            labelCheese.topAnchor.constraint(equalTo: imagePizza.bottomAnchor, constant: 50),
            labelCheese.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switchCheese.topAnchor.constraint(equalTo: labelCheese.topAnchor),
            switchCheese.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelVetchina.topAnchor.constraint(equalTo: labelCheese.bottomAnchor, constant: 20),
            labelVetchina.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switchVetchina.topAnchor.constraint(equalTo: labelVetchina.topAnchor),
            switchVetchina.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelMashroom.topAnchor.constraint(equalTo: labelVetchina.bottomAnchor, constant: 20),
            labelMashroom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switchMashroom.topAnchor.constraint(equalTo: labelMashroom.topAnchor),
            switchMashroom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelOlives.topAnchor.constraint(equalTo: labelMashroom.bottomAnchor, constant: 20),
            labelOlives.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switchOlives.topAnchor.constraint(equalTo: labelOlives.topAnchor),
            switchOlives.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            enterButton.topAnchor.constraint(equalTo: switchOlives.bottomAnchor, constant: 20),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 200),
            enterButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    @objc func handleEnterButton() {
        let billVC = BillViewController()
        if index == 0 {
            billVC.pizzaName = "Margherita"
        } else if index == 1 {
            billVC.pizzaName = "Pepperoni"
        }
        if switchCheese.isOn {
            billVC.cheese = true
        }
        if switchVetchina.isOn {
            billVC.vetchina = true
        }
        if switchMashroom.isOn {
            billVC.mashroom = true
        }
        if switchOlives.isOn {
            billVC.olives = true
        }
        navigationController?.pushViewController(billVC, animated: true)
    }
}
