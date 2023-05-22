//
//  LoginPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit
import FirebaseAuth

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = customFont(size: 24, font: .InterBold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0.05751294643, blue: 0.1677117348, alpha: 1)
        return label
    }()
    
    lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your username to log in to your \n account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.6922514439, green: 0.6922514439, blue: 0.6922514439, alpha: 1)
        label.numberOfLines = 0
        label.font = customFont(size: 13, font: .InterMedium)
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor =   #colorLiteral(red: 0, green: 0.05751294643, blue: 0.1677117348, alpha: 1)
        label.font = customFont(size: 18, font: .InterSemiBold)
        return label
    }()
    
    lazy var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1) ]
        textfield.attributedPlaceholder = NSAttributedString(string: "Enter username", attributes: attributes)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.isUserInteractionEnabled = true
        textfield.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        return textfield
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1) ]
        textfield.attributedPlaceholder = NSAttributedString(string: "Enter username", attributes: attributes)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.isSecureTextEntry = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.delegate = self
        textfield.isUserInteractionEnabled = true
        textfield.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        return textfield
    }()
    
    lazy var loginButton: Button = {
        let button = Button()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        view.backgroundColor = .white
        
    }
    
    @objc func didTapLoginButton() {
        guard let username = usernameTextfield.text, !username.isEmpty else {
            // Handle case when username is empty or not provided
            let alertController = UIAlertController(title: "Error", message: "Please enter a username.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let user = User(username: username)
        let vc = TabBar()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
        
    }
    
    func setupConstraint() {
        [loginLabel, descriptionlabel, usernameLabel, usernameTextfield, loginButton].forEach { view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            descriptionlabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            descriptionlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            descriptionlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 55),
            
            usernameLabel.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 17),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            
            usernameTextfield.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 15),
            usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextfield.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
}

