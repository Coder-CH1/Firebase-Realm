//
//  Button.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        // Set button properties
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.3955827355, green: 0.7141469717, blue: 0.6785815358, alpha: 1)
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.widthAnchor.constraint(equalToConstant: 320).isActive = true
    }
}
