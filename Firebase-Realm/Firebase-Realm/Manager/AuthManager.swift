//  CreateUserAuth.swift
//  Firebase-Realm
//
//  Created by Mac on 05/07/2023.
//

import Foundation
import Firebase
import FirebaseAuth

class CreateUserViewModel {
    var email: String = ""
    var password: String = ""

    func createUser(completion: @escaping (Bool, Error?) -> Void) {
        let details = ["email": email]
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }

            guard let uid = result?.user.uid else { return }

            Database.database().reference().child("users").child(uid).updateChildValues(details) { error, _ in
                if let error = error {
                    completion(false, error)
                    return
                }
                completion(true, nil)
            }
        }
    }
}


class LoginUserViewModel {
    func login(email: String?, password: String?, completion: @escaping (Error?) -> Void) {
        guard let email = email, let password = password else {
            let error = NSError(domain: "LoginError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please enter an email and password."])
            completion(error)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                print("You have successfully logged in")
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}

