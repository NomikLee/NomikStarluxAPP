//
//  CosmileViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/26.
//

import UIKit

class CosmileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 25/255, green: 44/255, blue: 60/255, alpha: 1)
        
        let vc = LoginRegisterMainViewController()
        navigationController?.pushViewController(vc, animated: false)
        
    }

}
