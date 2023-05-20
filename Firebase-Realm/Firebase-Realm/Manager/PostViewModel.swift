//
//  PostViewModel.swift
//  Firebase-Realm
//
//  Created by Mac on 20/05/2023.
//

import Foundation
// PostViewModel.swift
// PostViewModel.swift
class PostViewModel {
    let postManager = PostManager()
    
    func addPostToFirestore(collectionName: String, documentID: String, userImage: String, fullName: String, userName: String, location: String, time: String, postContent: String, media: String, isLiked: Bool, likeCount: Int, retweets: Int, isSaved: Bool, isShared: Bool, completion: @escaping (Error?) -> Void) {
            postManager.addPostToFirestore(collectionName: collectionName, documentID: documentID, userImage: userImage, fullName: fullName, userName: userName, location: location, time: time, postContent: postContent, media: media, isLiked: isLiked, likeCount: likeCount, retweets: retweets, isSaved: isSaved, isShared: isShared, completion: completion)
        }
}

