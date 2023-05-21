//
//  LoginPageViewModel.swift
//  Firebase-Realm
//
//  Created by Mac on 20/05/2023.
//

import Foundation
import FirebaseAuth

//class LoginPageViewModel {
//    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
//            if let user = authResult?.user {
//                completion(.success(user))
//            } else if let error = error {
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func isPasswordValid(_ password: String) -> Bool {
//        // Implement your custom password validation rules here
//        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
//        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return passwordPredicate.evaluate(with: password)
//    }
//
//    func showHomeScreen() {
//        let vc = TabBar()
//        vc.modalPresentationStyle = .fullScreen
//        let nav = UINavigationController(rootViewController: vc)
//        nav.navigationController?.present(nav, animated: true)
//    }
//
//    private func showLoginError() {
//        let alertController = UIAlertController(title: "Login Failed", message: "Invalid username", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alertController, animated: true, completion: nil)
//    }
//}
//
