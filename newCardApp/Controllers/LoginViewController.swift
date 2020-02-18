//
//  LoginViewController.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/11/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import Toast_Swift
import KeychainSwift


class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView(){
        view.backgroundColor = .white
        view = loginView
        loginView.setup()
        loginView.loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
    }
}

extension LoginViewController: Loadable {
    
    fileprivate func userLogin(_ login: String, _ password: String) {
        self.showLoader()
        AuthAPI.userLogin(login, password) { [weak self] result in
            if let wSelf = self {
                switch result {
                case .success(let response):
                    return wSelf.handleLoginSuccess(response)
                case .failure(let error):
                    return wSelf.handleLoginError(error)
                }
            }
        }
    }
    
    @objc
    fileprivate func handleLoginButton() {
        if loginView.usernameTextField.text == nil || loginView.usernameTextField.text?.isEmpty == true {
            self.view.makeToast("Incorrect username")
        }
        if loginView.usernameTextField.text == nil || loginView.passwordTextField.text?.isEmpty == true {
            self.view.makeToast("Incorrect password")
        } else {
            let username = loginView.usernameTextField.text!
            let password = loginView.passwordTextField.text!
            
            userLogin(username, password)
        }
    }
    
    
    fileprivate func handleLoginSuccess(_ response: LoginResponse) {
        self.hideLoaderSuccess()
        let user = BossModel(response)
        BossModel.currentBoss = user
        let keychain = KeychainSwift()
//        keychain.set(response.username, forKey: "username")
        keychain.set(response.profile.username, forKey: "username")
        keychain.set(response.token, forKey: "token")
        let vc = EmpListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func handleLoginError(_ error: Error) {
        self.hideLoaderFailure()
        Toast.showToast(error.localizedDescription)
    }
    
}
