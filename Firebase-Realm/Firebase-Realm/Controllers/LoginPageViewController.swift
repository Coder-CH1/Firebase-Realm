//
//  LoginPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    //var viewModel: LoginPageViewModel!
   // private var viewModel: AuthViewModel!
    
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
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.delegate = self
        let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1) ]
        textField.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: attributes)
        return textField
    }()
    
    lazy var loginButton: Button = {
        let button = Button()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var createUserButton: Button = {
        let button = Button()
        button.setTitle("Create User", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(createUserButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        view.backgroundColor = .white
        
    }
    
    
    
    @objc func signInButtonPressed() {
        if self.usernameTextfield.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.usernameTextfield.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let nextScreen = TabBar()
                    nextScreen.modalPresentationStyle = .fullScreen
                    self.present(nextScreen, animated: true, completion: nil)
                } else {
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func createUserButtonPressed() {
        let vc = CreateUserViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
    
    func setupConstraint() {
        view.addSubview(loginLabel)
        view.addSubview(descriptionlabel)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(createUserButton)
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
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            createUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            createUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            createUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
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
