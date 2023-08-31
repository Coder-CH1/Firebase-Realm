//
//  LoginPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit
import GoogleSignIn
import Firebase

class SigninPageViewController: UIViewController {
    
    var signinButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomButton()
        setupViews()
        view.backgroundColor = .black
    }
    
    func setupCustomButton() {
        signinButton = GIDSignInButton()
        signinButton.style = .wide
        signinButton.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        view.addSubview(signinButton)
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            signinButton.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
                              
    @objc func loginBtnPressed() {
            
        }
                              
                              
    }
                              
