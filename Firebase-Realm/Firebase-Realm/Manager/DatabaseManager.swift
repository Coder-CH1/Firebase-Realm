//
//  ChatsManager.swift
//  Firebase-Realm
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
        
        let database = Database.database().reference()
   
    func test() {
        database.child("user").setValue(["name": "John Doe"])
    }


}

