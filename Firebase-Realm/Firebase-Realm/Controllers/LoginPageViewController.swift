//
//  LoginPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    var loginAcct = LoginUserViewModel()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = customFont(size: 24, font: .InterBold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor =  UIColor(named: "loginLabelColor")
        return label
    }()
    
    lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your username to log in to your \n account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "descLabelColor")
        label.numberOfLines = 0
        label.font = customFont(size: 13, font: .InterMedium)
        return label
    }()
    
    lazy var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        let attributes = [NSAttributedString.Key.foregroundColor:  UIColor.init(named: "placeholderLabelColor") ]
        textfield.attributedPlaceholder = NSAttributedString(string: "Enter username", attributes: attributes as [NSAttributedString.Key : Any])
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.isUserInteractionEnabled = true
        textfield.backgroundColor = UIColor(named: "userTextFiedColor")
        return textfield
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        let attributes = [NSAttributedString.Key.foregroundColor:  UIColor.init(named: "placeholderLabelColor")]
        textfield.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: attributes as [NSAttributedString.Key : Any])
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.isSecureTextEntry = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.isUserInteractionEnabled = true
        textfield.backgroundColor = UIColor(named: "userTextFiedColor")
        return textfield
    }()
    
    lazy var loginButton: Button = {
        let button = Button()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var createUser: Button = {
        let button = Button()
        button.setTitle("Create User", for: .normal)
        button.setTitleColor(UIColor(named: "feedLabelColor"), for: .normal)
        button.addTarget(self, action: #selector(createUserBtnTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        view.backgroundColor = .white
    }
    
    @objc func didTapLoginButton() {
        guard let username = usernameTextfield.text, !username.isEmpty else {
            let alertController = UIAlertController(title: "Error", message: "Please enter a username.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let vc = TabBar()
        vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true)
        
    }
    
    @objc func createUserBtnTapped() {
        let vc = SignupPageViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginBtnPressed() {
        loginAcct.login(email: usernameTextfield.text, password: passwordTextfield.text) { [weak self] error in
               if let error = error {
                   let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                   let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                   alertController.addAction(defaultAction)
                   self?.present(alertController, animated: true, completion: nil)
               } else {
                   let nextScreen = HomePageViewController()
                   nextScreen.modalPresentationStyle = .fullScreen
                   self?.present(nextScreen, animated: true, completion: nil)
               }
           }
       }
    
    func setupConstraint() {
        [loginLabel, descriptionlabel, usernameTextfield, passwordTextfield, loginButton, createUser].forEach { view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            descriptionlabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            descriptionlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            descriptionlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 55),

            usernameTextfield.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 15),
            usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextfield.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 10),
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            createUser.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            createUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
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

