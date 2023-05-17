//
//  TextField.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class HeaderTextField: UIView {

        private let headerLabel = UILabel()
        private let textField = UITextField()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupHeaderLabel()
            setupTextField()
           
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupHeaderLabel()
            setupTextField()
            
        }
    
        private func setupHeaderLabel() {
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            headerLabel.font = UIFont.boldSystemFont(ofSize: 14)
            headerLabel.textColor = #colorLiteral(red: 0.1058823529, green: 0.1803921569, blue: 0.2941176471, alpha: 1)
            addSubview(headerLabel)
            NSLayoutConstraint.activate([
                headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                headerLabel.topAnchor.constraint(equalTo: topAnchor),
                headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
        
        private func setupTextField() {
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.layer.borderColor = #colorLiteral(red: 0.7529411765, green: 0.8, blue: 0.8549019608, alpha: 1)
            textField.layer.cornerRadius = 8
            addSubview(textField)
            NSLayoutConstraint.activate([
                textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
                textField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 18),
                textField.bottomAnchor.constraint(equalTo: bottomAnchor),
                textField.heightAnchor.constraint(equalToConstant: 40),
//                textField.widthAnchor.constraint(equalToConstant: 342)
            ])
        }
        
        func configure(header: String, placeholder: String, keyboardType: UIKeyboardType) {
            headerLabel.text = header
            textField.placeholder = placeholder
            textField.keyboardType = keyboardType
        }
    }
    
