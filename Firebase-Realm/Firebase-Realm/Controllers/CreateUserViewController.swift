//
//  CreateUserViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 21/05/2023.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class CreateUserViewController: UIViewController, UITextFieldDelegate {
    
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
    
    lazy var creatUserButton: Button = {
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
        // Do any additional setup after loading the view.
    }
    
    @objc func createUserButtonPressed() {
        guard let email = usernameTextfield.text else { return }
        guard let password = passwordTextField.text else { return }
        createUser(withEmail: email, password: password)
    }
    
    func createUser(withEmail email: String, password: String) {
        let details = ["email": email]
        Auth.auth().createUser(withEmail: usernameTextfield.text!, password: passwordTextField.text!) { result, error in
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: "Please fill your details", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            Database.database().reference().child("users").child(uid).updateChildValues(details, withCompletionBlock: { (error, ref ) in
                if let error = error {
                    print("failed to update database values with error: ", error.localizedDescription  )
                    return
                }
                print("successfully signed user up")
                let viewController = TabBar()
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.modalPresentationStyle = .fullScreen
                self.present(navigationController, animated: true, completion: nil)
            })
        }
    }
        
        
    func setupConstraint() {
        view.addSubview(usernameTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(creatUserButton)
    NSLayoutConstraint.activate([
        usernameTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
    usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
    usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
    usernameTextfield.heightAnchor.constraint(equalToConstant: 48),
    
    passwordTextField.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 16),
    passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
    passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
    passwordTextField.heightAnchor.constraint(equalToConstant: 48),
    
        creatUserButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
        creatUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
        creatUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
])
}
    

}
