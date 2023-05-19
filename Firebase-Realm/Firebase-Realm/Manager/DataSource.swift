//
//  FeedsDataSource.swift
//  Firebase-Realm
//
//  Created by Mac on 19/05/2023.
//

import Foundation
import UIKit

class DataSource {
    func createFeeds() -> [Feeds] {
        return [
    Feeds(feedImage: UIImageView(image: UIImage(named: "")), feedName: "", userName: "", location: "", time: "", labelPost: "", mediaPost: UIImageView(image: UIImage(named: "")), like: UIImageView(image: UIImage(named: "like")), comment: UIImageView(image: UIImage(named: "comment")), retweet: UIImageView(image: UIImage(named: "retweet")), save: UIImageView(image: UIImage(named: "save")), share: UIImageView(image: UIImage(named: "share")))
        ]
    }
}
