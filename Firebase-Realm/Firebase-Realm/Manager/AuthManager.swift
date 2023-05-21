//
//  AuthManager.swift
//  Firebase-Realm
//
//  Created by Mac on 20/05/2023.
//

import Foundation
import Firebase

class LoginViewModel {
    func createUser(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle user creation error
                completion(false, error)
                return
            }
            
            // User creation successful
            completion(true, nil)
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle sign-in error
                completion(false, error)
                return
            }
            
            // Sign-in successful
            completion(true, nil)
        }
    }
    
    func validatePassword(_ password: String) -> Bool {
        // Implement your custom password validation rules here
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        //return passwordPredicate.evaluate(with: password)
        return password.count >= 6
    }
}
