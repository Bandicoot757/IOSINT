//
//  LoginViewController.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 11.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Views
    
     private lazy var scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.showsVerticalScrollIndicator = false
         scrollView.delegate = self
         return scrollView
     }()
    
     private lazy var contentView: UIView = {
         let view = UIView()
         return view
     }()
        
    private lazy var logoImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "logo.png")
        imageView.image = image
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.tintColor = UIColor(named: "VKcolor")
        textField.roundCornersWithRadius(10, top: true, bottom: false, shadowEnabled: false)
        return textField
        }()
    
    private lazy var passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        textField.tintColor = UIColor(named: "VKcolor")
        textField.roundCornersWithRadius(10, top: false, bottom: true, shadowEnabled: false)
        return textField
        }()
    
    private lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        button.setTitle("Log In", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - @objc methods
    
    @objc func loginButtonTapped() {
        
        let destinationVC = ProfileViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        
        UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.show(destinationVC, sender: self)
        })
        
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            print("\(UIApplication.shared.backgroundTimeRemaining)")
          }
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
           scrollView.contentInset.bottom = .zero
           scrollView.verticalScrollIndicatorInsets = .zero
       }
    
    //MARK: - Layout Setting
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setSubviews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setSubviews() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        
        contentView.addSubviews(logoImage)
        contentView.addSubviews(loginTextField)
        contentView.addSubviews(passwordTextField)
        contentView.addSubviews(loginButton)

    }
    
}
