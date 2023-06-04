//
//  HomePageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit
import FirebaseFirestore
import Firebase
//import FirebaseDatabase

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var db: Firestore!
    let postManager = PostManager()
    let postViewModel = PostViewModel()
    
    var posts: [Post] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: HomePageCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraint()
        setupTitle()
        addPost()
        db = Firestore.firestore()
        postManager.fetchPosts { [weak self] posts in
            self?.posts = posts
        }
    }
    func updateUI(with posts: [Post]) {
        collectionView.reloadData()
    }
    
    func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Feed"
        titleLabel.textColor = #colorLiteral(red: 0.3955827355, green: 0.7141469717, blue: 0.6785815358, alpha: 1)
        titleLabel.sizeToFit()
        titleLabel.font = customFont(size: 23, font: .InterExtraBold)
        let titleBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = titleBarButtonItem
    }
    
    func setupConstraint() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  posts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomePageCell
        let post = posts[indexPath.item]
        
        // Configure the cell with the post data
        cell.setUpCustomCell(model: post)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (collectionView.frame.width - 25)
        return CGSize(width: cellWidth, height: collectionView.frame.height / 2.5)
    }
    
    func addPost() {
        let collectionName = "feeds"
        let documentID = "6mb65O740dtpkIOGVFAT"
        
        postViewModel.addPostToFirestore(collectionName: collectionName, documentID: documentID, userImage: "userImageURL",
                                         fullName: "John Doe",
                                         userName: "johndoe",
                                         location: "Nigeria",
                                         time: "2023-05-20 10:00:00",
                                         postContent: "Hello, world!",
                                         media: "postMediaURL",
                                         isLiked: true,
                                         likeCount: 12,
                                         retweets: 9,
                                         isSaved: false,
                                         isShared: false) { error in
            if let error = error {
                print("Error adding post: \(error.localizedDescription)")
            } else {
                print("Post added successfully")
            }
        }
    }
}

