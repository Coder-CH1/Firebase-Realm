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
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                        
                // Create Google Sign-In configuration object
                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config
                
        setupCustomButton()
        setupViews()
        view.backgroundColor = .black
    }
    
    func setupCustomButton() {
        signinButton = GIDSignInButton()
        signinButton.style = .wide
        signinButton.addTarget(self, action: #selector(signinBtnPressed), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        view.addSubview(signinButton)
        signinButton.addTarget(self, action: #selector(signinBtnPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            signinButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func signinBtnPressed() {
            // Start the Google Sign-In process
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
                guard error == nil else {
                    // Handle sign-in error
                    print("Google Sign-In error: \(error!.localizedDescription)")
                    return
                }

                guard let user = result?.user,
                    let idToken = user.idToken?.tokenString
                else {
                    // Handle user or token retrieval error
                    return
                }

                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                accessToken: user.accessToken.tokenString)

                // Sign in with Firebase using the obtained credential
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        // Handle Firebase sign-in error
                        print("Firebase Sign-In error: \(error.localizedDescription)")
                        return
                    }
                   let vc = TabBar()
                    vc.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
   
