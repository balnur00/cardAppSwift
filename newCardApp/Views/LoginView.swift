//
//  LoginView.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/11/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import UIKit

class LoginView:UIView{
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Username"
        return label
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter your username"
        textField.font = App.Font.regular(size: 20)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Password"
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter your password"
        textField.font = App.Font.regular(size: 20)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .red
        return label
    }()
    
    func setup(){
        self.backgroundColor = .brown
        self.addSubview(usernameLabel)
        self.addSubview(usernameTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(errorLabel)
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
//            make.height.equalTo(150)
        }
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
//            make.height.equalTo(200)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
    }
}
