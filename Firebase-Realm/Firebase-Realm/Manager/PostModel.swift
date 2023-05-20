//
//  ChatsModel.swift
//  Firebase-Realm
//
//  Created by Mac on 19/05/2023.
//

import Foundation
import UIKit
import FirebaseFirestore

struct Post {
    var userImage: UIImage?
    var fullname: String
    var userName: String
    var location: String
    var time: String
    var postContent: String
    var media: UIImage?
    var isLiked: Bool
    var likeCount: Int
    var retweets: Int
    var isSaved: Bool
    var isShared: Bool
    
}
