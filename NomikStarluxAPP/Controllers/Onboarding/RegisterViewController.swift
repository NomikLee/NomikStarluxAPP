//
//  RegisterViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/30.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Variables
    
    // MARK: - UI Components

    private let emailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 14/255, green: 31/255, blue: 44/255, alpha: 1)
        return view
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "  *電子信箱"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "  e.g. xxxx@starlux.com"
        textField.font = .systemFont(ofSize: 24, weight: .semibold)
        return textField
    }()
    
    private let emailDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .white
        button.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        button.isSelected = false
        return button
    }()
    
    private let confirmTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        
        let text = "我已閱讀並同意COSMILE入會規則與條款及星宇航空隱私保護政策"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.link, value: "https://www.first-link.com", range: (text as NSString).range(of: "COSMILE入會規則與條款"))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: (text as NSString).range(of: "COSMILE入會規則與條款"))
        attributedString.addAttribute(.link, value: "https://www.second-link.com", range: (text as NSString).range(of: "星宇航空隱私保護政策"))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: (text as NSString).range(of: "星宇航空隱私保護政策"))
        textView.attributedText = attributedString
        textView.linkTextAttributes = [
            .foregroundColor: UIColor(red: 231/255, green: 193/255, blue: 138/255, alpha: 1),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 12)
        return textView
    }()
    
    private let nextPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("下一步", for: .normal)
        button.backgroundColor = UIColor(red: 69/255, green: 51/255, blue: 77/255, alpha: 1)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "加入 COSMILE"
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(didTabDelet))
        
        
        view.addSubview(emailView)
        emailView.addSubview(emailLabel)
        emailView.addSubview(emailTextField)
        emailView.addSubview(emailDeleteButton)
        view.addSubview(selectButton)
        view.addSubview(confirmTextView)
        view.addSubview(nextPageButton)
        
        configureUI()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    private func configureButton() {
        selectButton.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
    }
    // MARK: - Selectors
    @objc private func didTabDelet() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func checkboxButtonTapped(_ sender: UIButton) {
        sender.isSelected = true
    }
    
    // MARK: - UI Setup
    private func configureUI() {
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailView.heightAnchor.constraint(equalToConstant: 60),
            
            emailLabel.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            emailDeleteButton.bottomAnchor.constraint(equalTo: emailView.bottomAnchor),
            emailDeleteButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            emailDeleteButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailDeleteButton.widthAnchor.constraint(equalToConstant: 50),
            
            selectButton.topAnchor.constraint(equalTo: emailView.bottomAnchor),
            selectButton.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            selectButton.widthAnchor.constraint(equalToConstant: 30),
            selectButton.heightAnchor.constraint(equalToConstant: 50),
            
            confirmTextView.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor),
            confirmTextView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            confirmTextView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 10),
            confirmTextView.heightAnchor.constraint(equalToConstant: 100),
            
            nextPageButton.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            nextPageButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            nextPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextPageButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    // MARK: - Extension


}
