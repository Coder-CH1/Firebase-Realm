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
    }
    
    func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Feed"
        titleLabel.textColor = UIColor(named: "feedLabelColor")
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
        return  20
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomePageCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (collectionView.frame.width - 25)
        return CGSize(width: cellWidth, height: collectionView.frame.height / 2.5)
    }
    
}

