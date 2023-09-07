//
//  PostManager.swift
//  Firebase-Realm
//
//  Created by Mac on 19/05/2023.
//

import Foundation
import FirebaseFirestore

class PostManager {
    private let db = Firestore.firestore()
    private let collectionName = "posts" // Replace with your actual collection name

    // Fetch posts from Firestore
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let postsRef = db.collection(collectionName)
        
        postsRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                completion([])
            } else {
                var posts: [Post] = []
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    // Parse data and create Post objects, similar to what you did in your code
                    // ...
                    // Create a Post object and add it to the 'posts' array
                    // ...
                }
                
                completion(posts)
            }
        }
    }

    // Add a post to Firestore
    func addPostToFirestore(post: Post, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection(collectionName).document()
        
        let data: [String: Any] = [
            "userImage": post.userImage,
            "fullname": post.fullname,
            "userName": post.userName,
            "location": post.location,
            "time": post.time,
            "postContent": post.postContent,
            // Add other post properties here
        ]
        
        docRef.setData(data) { error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
}
