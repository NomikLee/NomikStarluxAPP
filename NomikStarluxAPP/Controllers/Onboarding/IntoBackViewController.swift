//
//  IntoBackViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/26.
//

import UIKit

class IntoBackViewController: UIViewController {
    
    private let intoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "enterback")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(intoImageView)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            let intoVC = TabBarViewController()
            intoVC.modalPresentationStyle = .fullScreen
            self.present(intoVC, animated: true)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        intoImageView.frame = view.bounds
    }

}
