import UIKit

class ChoosePizzaViewController: UIViewController {
    
    private let imagePizzaMargarita: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let imagePizzaPepperoni: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let labelPizzaMargarita: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Margarita"
        return label
    }()
    private let labelPizzaPepperoni: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Pepperoni"
        return label
    }()
    private let buttonAddToCartMargarita: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        return button
    }()
    private let buttonAddToCartPepperoni: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pizza"
        setupNavigationBar()
        setupLayout()
        setupActions()
    }
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(cancelTapped))
    }
    
    private func setupLayout() {
        [imagePizzaMargarita,imagePizzaPepperoni,labelPizzaMargarita,labelPizzaPepperoni,buttonAddToCartMargarita,buttonAddToCartPepperoni].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            imagePizzaMargarita.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imagePizzaMargarita.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imagePizzaMargarita.heightAnchor.constraint(equalToConstant: 150),
            imagePizzaMargarita.widthAnchor.constraint(equalToConstant: 150),
            
            imagePizzaPepperoni.topAnchor.constraint(equalTo: imagePizzaMargarita.bottomAnchor, constant: 20),
            imagePizzaPepperoni.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imagePizzaPepperoni.heightAnchor.constraint(equalToConstant: 150),
            imagePizzaPepperoni.widthAnchor.constraint(equalToConstant: 150),
            
            labelPizzaMargarita.leadingAnchor.constraint(equalTo: imagePizzaMargarita.trailingAnchor, constant: 20),
            labelPizzaMargarita.centerYAnchor.constraint(equalTo: imagePizzaMargarita.centerYAnchor),
            
            labelPizzaPepperoni.leadingAnchor.constraint(equalTo: imagePizzaPepperoni.trailingAnchor, constant: 20),
            labelPizzaPepperoni.centerYAnchor.constraint(equalTo: imagePizzaPepperoni.centerYAnchor),
            
            buttonAddToCartMargarita.centerYAnchor.constraint(equalTo: imagePizzaMargarita.centerYAnchor),
            buttonAddToCartMargarita.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            buttonAddToCartPepperoni.centerYAnchor.constraint(equalTo: imagePizzaPepperoni.centerYAnchor),
            buttonAddToCartPepperoni.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            ])
    }
    
    
    private func setupActions() {
        buttonAddToCartMargarita.addTarget(self, action: #selector(addToCartMargaritaTapped), for: .touchUpInside)
        buttonAddToCartPepperoni.addTarget(self, action: #selector(addToCartPepperoniTapped), for: .touchUpInside)
    }
    
    @objc private func addToCartMargaritaTapped() {
        let ingridientsVC = IngridientsViewController()
        navigationController?.pushViewController(ingridientsVC, animated: true)
    }
    
    @objc private func addToCartPepperoniTapped() {
        let ingridientsVC = IngridientsViewController()
        ingridientsVC.index = 1
        navigationController?.pushViewController(ingridientsVC, animated: true)
    }
    
    @objc private func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
}
