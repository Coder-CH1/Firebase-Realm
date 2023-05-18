//
//  LoginViewModel.swift
//  Firebase-Realm
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import Firebase
import FirebaseAuth

// Define the User model
struct User {
    let username: String
    // Additional properties and methods as needed
}

// Create an array of User objects as a data source
let users: [User] = [
    User(username: "john"),
    User(username: "Emma"),
    User(username: "alex"),
    // Add more user objects as needed
]

