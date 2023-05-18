//
//  Label.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class Label: UILabel {
    
    init(label: String) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: 14)
        textColor = UIColor(named: "dark")
        translatesAutoresizingMaskIntoConstraints = false
        self.text = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
