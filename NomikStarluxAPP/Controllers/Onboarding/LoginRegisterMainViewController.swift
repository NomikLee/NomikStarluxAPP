//
//  LoginRegisterMainViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/30.
//

import UIKit

class LoginRegisterMainViewController: UIViewController {
    // MARK: - Variables
    
    // MARK: - UI Components
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "titleimage")
        return imageView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 69/255, green: 51/255, blue: 77/255, alpha: 1)
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 69/255, green: 51/255, blue: 77/255, alpha: 1)
        button.setTitle("註冊", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        
        view.addSubview(titleImage)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        configureUI()
        configureButton()
    }
    
    // MARK: - Functions
    private func configureButton() {
        loginButton.addTarget(self, action: #selector(didTabLogin), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTabRegister), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc private func didTabLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTabRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - UI Setup
    private func configureUI() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor),
            titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleImage.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }

}
