//
//  TabBarViewController.swift
//  NomikStarluxAPP
//
//  Created by Pinocchio on 2024/6/26.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = JourneyViewController()
        let vc3 = CosmileViewController()
        let vc4 = ManageViewController()
        let vc5 = MoreViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        nav1.tabBarItem.title = "首頁"
        nav2.tabBarItem.title = "預訂行程"
        nav3.tabBarItem.title = "COSMILE"
        nav4.tabBarItem.title = "行程管理"
        nav5.tabBarItem.title = "更多"
        
        nav1.tabBarItem.image = UIImage(systemName: "house.fill")
        nav2.tabBarItem.image = UIImage(systemName: "airplane.departure")
        nav3.tabBarItem.image = UIImage(named: "cosmile")
        nav4.tabBarItem.image = UIImage(systemName: "suitcase.cart.fill")
        nav5.tabBarItem.image = UIImage(systemName: "ellipsis.bubble.fill")
        
        UITabBar.appearance().tintColor = UIColor(red: 231/255, green: 193/255, blue: 138/255, alpha: 1)
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
    }
}
