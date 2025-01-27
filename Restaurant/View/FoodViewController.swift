import UIKit

class FoodViewController: UIViewController {
    
    private var pizzaButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var sushiButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food"
        setupUI()
        setupLayout()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        pizzaButton.setTitle("Pizza", for: .normal)
        pizzaButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        pizzaButton.titleLabel?.textAlignment = .center
        pizzaButton.backgroundColor = .systemBlue
        pizzaButton.layer.cornerRadius = 10
        pizzaButton.addTarget(self, action: #selector(didTapPizzaButton), for: .touchUpInside)
        view.addSubview(pizzaButton)
        
        sushiButton.setTitle("Sushi", for: .normal)
        sushiButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        sushiButton.titleLabel?.textAlignment = .center
        sushiButton.backgroundColor = .systemBlue
        sushiButton.layer.cornerRadius = 10
        view.addSubview(sushiButton)
    }
    
    private func setupLayout() {
        pizzaButton.translatesAutoresizingMaskIntoConstraints = false
        sushiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            pizzaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pizzaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pizzaButton.heightAnchor.constraint(equalToConstant: 100),
            
            sushiButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
            sushiButton.leadingAnchor.constraint(equalTo: pizzaButton.leadingAnchor),
            sushiButton.trailingAnchor.constraint(equalTo: pizzaButton.trailingAnchor),
            sushiButton.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    @objc private func didTapPizzaButton() {
        let choosePizzaVC = ChoosePizzaViewController()
        navigationController?.pushViewController(choosePizzaVC, animated: true)
    }
}
