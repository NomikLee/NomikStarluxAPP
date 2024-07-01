//
//  HomeViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    private var gradientLayers: [CAGradientLayer] = []
    private let buttonData = [("預訂行程", "airplane.circle"), ("線上報到", "checkmark.circle"), ("加入行程", "plus.circle")]
    
    // MARK: - UI Components
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
        label.text = "Hello!"
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
    
    private lazy var stackButtons: [UIButton] = buttonData.map{ (titles, images) in
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = titles
        configuration.image = UIImage(systemName: images)
        configuration.imagePadding = 10
        configuration.imagePlacement = .top
        
        let button = UIButton(configuration: configuration)
        button.tintColor = UIColor(red: 231/255, green: 193/255, blue: 138/255, alpha: 1)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
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
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private var advertiseImageView: [UIImageView] = {
        var imageViews: [UIImageView] = []
        
        for i in 1...6 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: i.description)
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.withAlphaComponent(0.5).cgColor, UIColor.clear.cgColor]
            gradientLayer.locations = [0.0, 1.0]
            imageView.layer.addSublayer(gradientLayer)
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
        pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        return pageControl
    }()
    
    private let announcementBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        view.alpha = 0.8
        return view
    }()
    
    private let barExclamationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private let barAnnouncementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "完整布局港澳航線， 7月16日香港盛大開航！"
        return label
    }()
    
    private let barDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .white
        button.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        return button
    }()
    
    private let journeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("即刻預定", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 69/255, green: 50/255, blue: 77/255, alpha: 1)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 13
        return button
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "與星宇一起旅行"
        label.textColor = .white.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    
    // MARK: - Lifecycle
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
        view.addSubview(announcementBarView)
        announcementBarView.addSubview(barExclamationImageView)
        announcementBarView.addSubview(barAnnouncementLabel)
        announcementBarView.addSubview(barDeleteButton)
        view.addSubview(pageImageControl)
        view.addSubview(journeyButton)
        view.addSubview(contentLabel)
        
        pageImageScrollView.delegate = self
        
        configureUI()
        configureStackButton()
        configureButtonTarget()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for (index, imageView) in advertiseImageView.enumerated() {
            gradientLayers[index].frame = imageView.bounds
        }
    }
    
    // MARK: - Functions
    private func configureStackButton() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            button.tag = i
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    private func configureButtonTarget() {
        journeyButton.addTarget(self, action: #selector(didIntoJourney), for: .touchUpInside)
        pageImageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        barDeleteButton.addTarget(self, action: #selector(didBarDelete), for: .touchUpInside)
        loginRegisterButton.addTarget(self, action: #selector(didTabLoginRegister), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc private func didTabLoginRegister() {
        let vc = CosmileViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func didBarDelete() {
        announcementBarView.isHidden = true
    }
    
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let offsetX = CGFloat(currentPage) * pageImageScrollView.bounds.size.width
        pageImageScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    @objc private func didIntoJourney() {
        let journeyVC = JourneyViewController()
        navigationController?.pushViewController(journeyVC, animated: true)
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
    
    // MARK: - UI Setup
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
            sectionStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            sectionStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
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
            
            announcementBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            announcementBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            announcementBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            announcementBarView.heightAnchor.constraint(equalToConstant: 45),
            
            barAnnouncementLabel.topAnchor.constraint(equalTo: announcementBarView.topAnchor),
            barAnnouncementLabel.bottomAnchor.constraint(equalTo: announcementBarView.bottomAnchor),
            barAnnouncementLabel.centerXAnchor.constraint(equalTo: announcementBarView.centerXAnchor),
            barAnnouncementLabel.widthAnchor.constraint(equalToConstant: 270),
            
            barExclamationImageView.topAnchor.constraint(equalTo: announcementBarView.topAnchor, constant: 1),
            barExclamationImageView.bottomAnchor.constraint(equalTo: announcementBarView.bottomAnchor, constant: -1),
            barExclamationImageView.trailingAnchor.constraint(equalTo: barAnnouncementLabel.leadingAnchor, constant: -5),
            barExclamationImageView.widthAnchor.constraint(equalToConstant: 25),
            
            barDeleteButton.topAnchor.constraint(equalTo: announcementBarView.topAnchor),
            barDeleteButton.bottomAnchor.constraint(equalTo: announcementBarView.bottomAnchor),
            barDeleteButton.leadingAnchor.constraint(equalTo: barAnnouncementLabel.trailingAnchor),
            barDeleteButton.widthAnchor.constraint(equalToConstant: 40),

            pageImageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            pageImageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageImageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageImageControl.heightAnchor.constraint(equalToConstant: 50),
            
            journeyButton.bottomAnchor.constraint(equalTo: pageImageControl.topAnchor),
            journeyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            journeyButton.widthAnchor.constraint(equalToConstant: 110),
            journeyButton.heightAnchor.constraint(equalToConstant: 26),
            
            contentLabel.bottomAnchor.constraint(equalTo: journeyButton.topAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        for imageView in advertiseImageView {
            contentView.addSubview(imageView)
            if let gradientLayer = imageView.layer.sublayers?.compactMap({ $0 as? CAGradientLayer }).first {
                gradientLayers.append(gradientLayer)
            }
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

// MARK: - Extension
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageImageControl.currentPage = Int(page)
    }
}

