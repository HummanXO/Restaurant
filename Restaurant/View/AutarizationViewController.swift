import UIKit

class AutarizationViewController: UIViewController {
    
    private let iconImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "restaurant_icon")
        img.contentMode = .scaleToFill
        return img
    }()
    
    private let phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let phoneTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.keyboardType = .numberPad
        tf.placeholder = "Enter phone number"
        return tf
    }()
    
    private let separatorPhone : UIView = {
        let separator = UIView()
        separator.backgroundColor = .gray
        return separator
    }()
    
    private let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter password"
        return tf
    }()
    
    private let separatorPassword : UIView = {
        let separator = UIView()
        separator.backgroundColor = .gray
        return separator
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.isEnabled = false
        button.setTitle("Log In", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupActions()
    }
    
    private func setupLayout() {
        [iconImage, phoneLabel, phoneTextField, separatorPhone, passwordLabel, passwordTextField, separatorPassword, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 100),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5),
            phoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            separatorPhone.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 5),
            separatorPhone.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            separatorPhone.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
            separatorPhone.heightAnchor.constraint(equalToConstant: 1),
            
            passwordLabel.topAnchor.constraint(equalTo: separatorPhone.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            separatorPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            separatorPassword.leadingAnchor.constraint(equalTo: separatorPhone.leadingAnchor),
            separatorPassword.trailingAnchor.constraint(equalTo: separatorPhone.trailingAnchor),
            separatorPassword.heightAnchor.constraint(equalToConstant: 1),
            
            button.topAnchor.constraint(equalTo: separatorPassword.bottomAnchor, constant: 100),
            button.leadingAnchor.constraint(equalTo: separatorPassword.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: separatorPassword.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupActions() {
        button.addTarget(self, action: #selector(logInButton), for: .touchUpInside)
        passwordTextField.addTarget(self, action: #selector(updateButton), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(updateButton), for: .editingChanged)
    }
    
    @objc private func updateButton() {
        if phoneTextField.text != "" && passwordTextField.text != "" {
            button.backgroundColor = .blue
            button.isEnabled = true
        }
    }
    
    @objc private func logInButton() {
            let foodVC = FoodViewController()
            navigationController?.pushViewController(foodVC, animated: true)
    }
}
