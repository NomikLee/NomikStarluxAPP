//
//  HomeViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starluxIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 16/255, green: 32/255, blue: 44/255, alpha: 1)
        return view
    }()
    
    private let helloNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello! 芫豪"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private let loginRegisterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("登入/註冊", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    private let buttonData = [("預訂行程", "airplane.circle"), ("線上報到", "checkmark.circle"), ("加入行程", "plus.circle")]
    private lazy var stackButtons: [UIButton] = buttonData.map{ (titles, images) in
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = titles
        configuration.image = UIImage(systemName: images)
        configuration.imagePadding = 10
        configuration.imagePlacement = .top
        
        let button = UIButton(configuration: configuration)
        button.tintColor = UIColor(red: 231/255, green: 193/255, blue: 138/255, alpha: 1)
        button.setTitleColor(UIColor.gray, for: .normal)
        
        return button
    }
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: stackButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private let pageImageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let advertiseImageView: [UIImageView] = {
        var imageViews: [UIImageView] = []
        
        for i in 1...6 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: i.description)
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageViews.append(imageView)
        }
        return imageViews
    }()
    
    private let pageImageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemYellow
        return pageControl
    }()
    
    private let announcementBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        view.alpha = 0.8
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        view.addSubview(logoImageView)
        view.addSubview(barView)
        barView.addSubview(helloNameLabel)
        barView.addSubview(loginRegisterButton)
        view.addSubview(sectionStack)
        view.addSubview(pageImageScrollView)
        pageImageScrollView.addSubview(contentView)
        
        configureUI()
        configureStackButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        advertiseGradient()
    }
    
    private func configureStackButton() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            button.tag = i
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let journeyVC = JourneyViewController()
            navigationController?.pushViewController(journeyVC, animated: true)
        case 1:
            if let url = URL(string: "https://checkin.si.amadeus.net/static/PRD/JX/#/identification?ln=tw"){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        default:
            print("Home")
        }
    }
    
    private func advertiseGradient() {
        for i in 0...5 {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor.systemBackground.withAlphaComponent(0.5).cgColor,
                UIColor.clear.cgColor,
            ]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = advertiseImageView[i].bounds
            advertiseImageView[i].layer.addSublayer(gradientLayer)
        }
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            barView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            barView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 35),
            
            helloNameLabel.topAnchor.constraint(equalTo: barView.topAnchor),
            helloNameLabel.leadingAnchor.constraint(equalTo: barView.leadingAnchor, constant: 10),
            helloNameLabel.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            
            loginRegisterButton.topAnchor.constraint(equalTo: barView.topAnchor),
            loginRegisterButton.trailingAnchor.constraint(equalTo: barView.trailingAnchor, constant: -10),
            loginRegisterButton.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            
            sectionStack.topAnchor.constraint(equalTo: barView.bottomAnchor),
            sectionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sectionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sectionStack.heightAnchor.constraint(equalToConstant: 100),
            
            pageImageScrollView.topAnchor.constraint(equalTo: sectionStack.bottomAnchor),
            pageImageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageImageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageImageScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: pageImageScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: pageImageScrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: pageImageScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: pageImageScrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: pageImageScrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: pageImageScrollView.widthAnchor, multiplier: 6),
            
        ])
        
        for i in 0...5 {
            contentView.addSubview(advertiseImageView[i])
        }
        
        NSLayoutConstraint.activate([
            advertiseImageView[0].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[0].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            advertiseImageView[0].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[0].widthAnchor.constraint(equalTo: view.widthAnchor),
            
            advertiseImageView[1].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[1].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[1].leadingAnchor.constraint(equalTo: advertiseImageView[0].trailingAnchor),
            advertiseImageView[1].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[1].widthAnchor.constraint(equalTo: view.widthAnchor),
            
            advertiseImageView[2].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[2].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[2].leadingAnchor.constraint(equalTo: advertiseImageView[1].trailingAnchor),
            advertiseImageView[2].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[2].widthAnchor.constraint(equalTo: view.widthAnchor),
            
            advertiseImageView[3].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[3].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[3].leadingAnchor.constraint(equalTo: advertiseImageView[2].trailingAnchor),
            advertiseImageView[3].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[3].widthAnchor.constraint(equalTo: view.widthAnchor),
            
            advertiseImageView[4].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[4].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[4].leadingAnchor.constraint(equalTo: advertiseImageView[3].trailingAnchor),
            advertiseImageView[4].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[4].widthAnchor.constraint(equalTo: view.widthAnchor),
            
            advertiseImageView[5].topAnchor.constraint(equalTo: contentView.topAnchor),
            advertiseImageView[5].bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            advertiseImageView[5].leadingAnchor.constraint(equalTo: advertiseImageView[4].trailingAnchor),
            advertiseImageView[5].heightAnchor.constraint(equalTo: contentView.heightAnchor),
            advertiseImageView[5].widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
    }


}

