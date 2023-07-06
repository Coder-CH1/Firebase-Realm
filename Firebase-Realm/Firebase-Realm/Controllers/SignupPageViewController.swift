//
//  SignupPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 05/07/2023.
//

import UIKit

class SignupPageViewController: UIViewController, UITextFieldDelegate {
    
    var createUserAcct = CreateUserViewModel()
    
    lazy var createUserLabel: UILabel = {
        let label = UILabel()
        label.text = "Create User"
        label.font = customFont(size: 24, font: .InterBold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor =  UIColor(named: "loginLabelColor")
        return label
    }()
    
    lazy var emailTextfield: UITextField = {
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
        let attributes = [NSAttributedString.Key.foregroundColor:  UIColor.init(named: "placeholderLabelColor") ]
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
    
    lazy var createUserBtn: Button = {
        let button = Button()
        button.setTitle("Create User", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(createUserBtnTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
    }
    
    @objc func createUserBtnTapped() {
        createUserAcct.email = emailTextfield.text ?? ""
        createUserAcct.password = passwordTextfield.text ?? ""
        createUserAcct.createUser { success, error in
                if success {
                    let viewController = HomePageViewController()
                    let navigationController = UINavigationController(rootViewController: viewController)
                    navigationController.modalPresentationStyle = .fullScreen
                    self.present(navigationController, animated: true, completion: nil)
                } else if let error = error {
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    
    func setupViews() {
        [createUserLabel, emailTextfield, passwordTextfield, createUserBtn].forEach { view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            createUserLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            createUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            emailTextfield.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: 20),
            emailTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            emailTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            emailTextfield.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 20),
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 48),
            
            createUserBtn.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 20),
            createUserBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            createUserBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
        ])
    }
}
