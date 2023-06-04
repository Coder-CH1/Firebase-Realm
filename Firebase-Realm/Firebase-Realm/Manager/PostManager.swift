//
//  PostManager.swift
//  Firebase-Realm
//
//  Created by Mac on 19/05/2023.
//

import Foundation
import FirebaseFirestore
import Firebase
//import FirebaseDatabase

class PostManager {
    private let db = Firestore.firestore()
    private let collectionName = "feeds" // Replace with your actual collection name

    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let postsRef = db.collection(collectionName)
        
        postsRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                completion([])
            } else {
                var posts: [Post] = []
                
                for document in querySnapshot!.documents {
                    let userImage = document.data()["imageURL"] as? UIImage
                    let fullname = document.data()["fullname"] as? String ?? ""
                    let username = document.data()["userName"] as? String ?? ""
                    let location = document.data()["location"] as? String ?? ""
                    let time = document.data()["time"] as? String ?? ""
                    let postContent = document.data()["postContent"] as? String ?? ""
                    let media = document.data()["imageURL"] as? UIImage
                    let isLiked = document.data()["isLike"] as? Bool ?? false
                    let likeCount = document.data()["likeCount"] as? Int ?? 0
                    let retweets = document.data()["retweets"] as? Int ?? 0
                    let isSaved = document.data()["isSaved"] as? Bool ?? false
                    let isShared = document.data()["isShared"] as? Bool ?? false
                    // Parse other properties here
                    
                    let post = Post(userImage: userImage, fullname: fullname, userName: username, location: location, time: time, postContent: postContent, media: media, isLiked: isLiked, likeCount: likeCount, retweets: retweets, isSaved: isSaved, isShared: isShared)
                    posts.append(post)
                }
                
                completion(posts)
            }
        }
    }

    
    func addPostToFirestore(collectionName: String, documentID: String, userImage: String, fullName: String, userName: String, location: String, time: String, postContent: String, media: String, isLiked: Bool, likeCount: Int, retweets: Int, isSaved: Bool, isShared: Bool, completion: @escaping (Error?) -> Void) {
            let docRef = db.collection(collectionName).document(documentID)
            
            let data: [String: Any] = [
                "userImage": userImage,
                "fullName": fullName,
                "userName": userName,
                "location": location,
                "time": time,
                "postContent": postContent,
                "media": media,
                "isLiked": isLiked,
                "likeCount": likeCount,
                "retweets": retweets,
                "isSaved": isSaved,
                "isShared": isShared
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
        
       
