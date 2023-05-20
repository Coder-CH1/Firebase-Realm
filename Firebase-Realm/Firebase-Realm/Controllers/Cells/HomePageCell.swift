//
//  HomeCell.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class HomePageCell: UICollectionViewCell {
    
    static let identifier = "HomeCell"
    
    lazy var feedsImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var feedsName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feedsUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feedsLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feedsTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feedsPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feedsMedia: UIImageView = {
        let media = UIImageView()
        media.translatesAutoresizingMaskIntoConstraints = false
        return media
    }()
    
    lazy var likeIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var commentIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var retweetIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var saveIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var shareIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
    }
    
    func setupConstraint() {
        self.addSubview(feedsImage)
        self.addSubview(feedsName)
        self.addSubview(feedsUsername)
        self.addSubview(feedsLocation)
        self.addSubview(feedsTime)
        self.addSubview(feedsPost)
        self.addSubview(feedsMedia)
        self.addSubview(likeIcon)
        self.addSubview(commentIcon)
        self.addSubview(retweetIcon)
        self.addSubview(saveIcon)
        self.addSubview(shareIcon)
        NSLayoutConstraint.activate([
            feedsImage.topAnchor.constraint(equalTo: self.topAnchor),
            feedsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            feedsName.topAnchor.constraint(equalTo: self.topAnchor),
            feedsName.leadingAnchor.constraint(equalTo: feedsImage.leadingAnchor, constant: 12),
            
            feedsUsername.topAnchor.constraint(equalTo: feedsName.bottomAnchor, constant: 4),
            feedsUsername.leadingAnchor.constraint(equalTo: feedsImage.leadingAnchor, constant: 12),
            
            feedsLocation.topAnchor.constraint(equalTo: feedsName.bottomAnchor, constant: 4),
            feedsLocation.leadingAnchor.constraint(equalTo: feedsUsername.leadingAnchor, constant: 16),
            
            feedsTime.leadingAnchor.constraint(equalTo: feedsLocation.leadingAnchor, constant: 16),
            
            feedsPost.topAnchor.constraint(equalTo: feedsImage.bottomAnchor, constant: 16),
            feedsPost.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            feedsPost.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            feedsMedia.topAnchor.constraint(equalTo: feedsPost.bottomAnchor, constant: 12),
            feedsMedia.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            feedsMedia.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            likeIcon.topAnchor.constraint(equalTo: feedsMedia.bottomAnchor, constant: 17),
            likeIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            commentIcon.topAnchor.constraint(equalTo: feedsMedia.bottomAnchor, constant: 17),
            commentIcon.leadingAnchor.constraint(equalTo: likeIcon.leadingAnchor, constant: 38),
            
            retweetIcon.topAnchor.constraint(equalTo: feedsMedia.bottomAnchor, constant: 17),
            retweetIcon.leadingAnchor.constraint(equalTo: commentIcon.leadingAnchor, constant: 38),
            
            saveIcon.topAnchor.constraint(equalTo: feedsMedia.bottomAnchor, constant: 17),
            saveIcon.leadingAnchor.constraint(equalTo: retweetIcon.leadingAnchor, constant: 38),
            
            shareIcon.topAnchor.constraint(equalTo: feedsMedia.bottomAnchor, constant: 17),
            shareIcon.leadingAnchor.constraint(equalTo: saveIcon.leadingAnchor, constant: 38)
        ])
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setUpCustomCell(model: Post) {
        feedsImage.image = model.userImage
        feedsName.text = model.fullname
        feedsUsername.text = model.userName
        feedsLocation.text = model.location
        feedsTime.text = model.time
        feedsPost.text = model.postContent
        
//        if !model.no_media {
//            if model.video {
//                feedsMedia.isHidden = true
//                videoPlayerView.isHidden = false
//                videoPlayerView.configure(with: model.videoURL)
//            } else {
//                feedsMedia.isHidden = false
//                videoPlayerView.isHidden = true
//                feedsMedia.image = model.media
//            }
//        } else {
//            feedsMedia.isHidden = true
//            videoPlayerView.isHidden = true
//        }
        
        likeIcon.image = model.isLiked ? UIImage(named: "likeIconFilled") : UIImage(named: "likeIconEmpty")
        commentIcon.image = UIImage(named: "commentIcon")
        retweetIcon.image = UIImage(named: "retweetIcon")
        saveIcon.image = model.isSaved ? UIImage(named: "saveIconFilled") : UIImage(named: "saveIconEmpty")
        shareIcon.image = UIImage(named: "shareIcon")
    }

    
}
