//
//  ChatsPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class ChatsPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "Chat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0.05751294643, blue: 0.1677117348, alpha: 1)
        label.font = customFont(size: 26, font: .InterMedium)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: "ChatsTableViewCell")
        return tableView
    }()
    
    lazy var addButton: Button = {
        let button = Button()
        button.setImage(UIImage(named: "addButton"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        tableView.separatorInset = UIEdgeInsets.zero
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonTapped() {
        let bottomSheetViewController = ChatBottomSheetViewController()
        
        bottomSheetViewController.modalPresentationStyle = .custom
        bottomSheetViewController.transitioningDelegate = self
        
        present(bottomSheetViewController, animated: true, completion: nil)
    }
    
    @objc func customButtonTapped() {
        // Handle custom button tap
        print("Custom button tapped")
    }
    
    func setupConstraint() {
        view.addSubview(chatLabel)
        view.addSubview(tableView)
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            chatLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            chatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: chatLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 350),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 308),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsTableViewCell", for: indexPath) as! ChatsTableViewCell
        cell.backgroundColor = .lightGray
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
