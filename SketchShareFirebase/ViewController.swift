//
//  ViewController.swift
//  SketchShareFirebase
//
//  Created by SEAN on 2018/7/11.
//  Copyright © 2018年 SEAN. All rights reserved.
//

import UIKit
import FirebaseFramework
import FBSDKLoginKit

class ViewController: UIViewController {
    
    let customFBLoginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Facebook帳戶登入", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 66/255, green: 103/255, blue: 178/255, alpha: 1)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFacebookLoginButton()
        firebaseManager.loginManager.checkUserId()
    }
    
    private func setupFacebookLoginButton(){
        view.addSubview(customFBLoginButton)
        customFBLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customFBLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 16).isActive = true
        customFBLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        customFBLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc private func handleCustomFBLogin(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, error) in
            if error != nil{
                print("Custom FB Login failed: ", error ?? "error")
            }
            firebaseManager.loginManager.signInFirebaseWithFB()
        }
        
    }
    
    
   


}

