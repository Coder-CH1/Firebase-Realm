//
//  LoginPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit
import Firebase
//import FirebaseAuth

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
        textfield.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        return textfield
    }()
    
    lazy var loginButton: Button = {
        let button = Button()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        view.backgroundColor = .white
        
    }
    
    @objc func loginButtonPressed() {
        guard let username = usernameTextfield.text else {
            displayAlert(message: "Please enter a username")
            return
        }
        
        if let user = authenticateUser(withUsername: username) {
            // Login successful, navigate to the next screen
            let nextViewController = TabBar() // Pass the user object to the next screen if needed
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            // Login failed, display error message or perform appropriate action
            displayAlert(message: "Invalid username")
        }
    }
    
    func authenticateUser(withUsername username: String) -> User? {
        // Find the user with the matching username
        if let user = users.first(where: { $0.username == username }) {
            return user
        } else {
            return nil
        }
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func setupConstraint() {
        view.addSubview(loginLabel)
        view.addSubview(descriptionlabel)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextfield)
        view.addSubview(loginButton)
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
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
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
