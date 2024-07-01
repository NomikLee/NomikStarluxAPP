//
//  LoginViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/30.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Variables
    
    // MARK: - UI Components
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "titleimage")
        return imageView
    }()
    
    private let idView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 14/255, green: 31/255, blue: 44/255, alpha: 1)
        return view
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "  COSMILE ID/電子信箱"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "  請輸入"
        textField.font = .systemFont(ofSize: 24, weight: .semibold)
        return textField
    }()
    
    private let idDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 14/255, green: 31/255, blue: 44/255, alpha: 1)
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "  密碼"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "  請輸入"
        textField.font = .systemFont(ofSize: 24, weight: .semibold)
        return textField
    }()
    
    private let hidPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let forgetPasswordButton: UIButton = {
        let attributedString = NSAttributedString(string: "忘記密碼?", attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let deleteIdButton: UIButton = {
        let attributedString = NSAttributedString(string: "刪除帳戶?", attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let loginPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("登入", for: .normal)
        button.backgroundColor = UIColor(red: 69/255, green: 51/255, blue: 77/255, alpha: 1)
        return button
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        view.addSubview(titleImage)
        view.addSubview(idView)
        view.addSubview(passwordView)
        idView.addSubview(idLabel)
        idView.addSubview(idTextField)
        idView.addSubview(idDeleteButton)
        passwordView.addSubview(passwordLabel)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(hidPasswordButton)
        view.addSubview(forgetPasswordButton)
        view.addSubview(deleteIdButton)
        view.addSubview(loginPageButton)
        
        configureUI()
        configureButton()
    }
    
    // MARK: - Functions
    private func configureButton() {
        idDeleteButton.addTarget(self, action: #selector(idDeleteButtonTapped), for: .touchUpInside)
        hidPasswordButton.addTarget(self, action: #selector(hidPasswordButtonTapped(_:)), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
        deleteIdButton.addTarget(self, action: #selector(deleteIdButtonTapped), for: .touchUpInside)
        loginPageButton.addTarget(self, action: #selector(loginPageButtonTapped), for: .touchUpInside)
    }
    // MARK: - Selectors
    @objc private func idDeleteButtonTapped() {
        print("已刪除id輸入")
    }
    
    @objc private func hidPasswordButtonTapped(_ sender: UIButton) {
        guard let currentImage = sender.currentImage else { return }
        
        if currentImage == UIImage(systemName: "eye.slash.fill") {
            hidPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }else {
            hidPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
        print("已隱藏密碼")
    }
    
    @objc private func forgetPasswordButtonTapped() {
        print("已進入修改密碼頁面")
    }
    
    @objc private func deleteIdButtonTapped() {
        if let url = URL(string: "https://www.starlux-airlines.com/zh-TW/Support/cosmile-e-forms/account-deletion?layout=hidden") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func loginPageButtonTapped() {
        print("已登入")
    }
    
    // MARK: - UI Setup
    private func configureUI() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor),
            titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleImage.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            idView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            idView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            idView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            idView.heightAnchor.constraint(equalToConstant: 60),
            
            passwordView.topAnchor.constraint(equalTo: idView.bottomAnchor, constant: 25),
            passwordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordView.heightAnchor.constraint(equalToConstant: 60),
            
            idLabel.topAnchor.constraint(equalTo: idView.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: idView.leadingAnchor),
            idLabel.trailingAnchor.constraint(equalTo: idView.trailingAnchor),
            idLabel.heightAnchor.constraint(equalToConstant: 25),
            
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            idTextField.leadingAnchor.constraint(equalTo: idView.leadingAnchor),
            idTextField.heightAnchor.constraint(equalToConstant: 35),
            
            idDeleteButton.bottomAnchor.constraint(equalTo: idView.bottomAnchor),
            idDeleteButton.trailingAnchor.constraint(equalTo: idView.trailingAnchor),
            idDeleteButton.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            idDeleteButton.widthAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: passwordView.topAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            passwordLabel.heightAnchor.constraint(equalToConstant: 25),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            hidPasswordButton.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
            hidPasswordButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            hidPasswordButton.topAnchor.constraint(equalTo: passwordView.topAnchor),
            hidPasswordButton.widthAnchor.constraint(equalToConstant: 50),
            
            forgetPasswordButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 20),
            forgetPasswordButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            forgetPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            deleteIdButton.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 5),
            deleteIdButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            deleteIdButton.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            deleteIdButton.heightAnchor.constraint(equalToConstant: 30),
            
            loginPageButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            loginPageButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            loginPageButton.topAnchor.constraint(equalTo: deleteIdButton.bottomAnchor, constant: 15),
            loginPageButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    // MARK: - Extension

}
