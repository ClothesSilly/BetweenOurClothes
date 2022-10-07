//
//  MainTabBarController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedVC = MainFeedViewController()
        let usedVC = MyClosetViewController()
        
        let DmVC = MainFeedViewController()
        let myClothee = MainFeedViewController()
        
        
        feedVC.title = "Main"
        usedVC.title = "used"
        DmVC.title = "used"
        myClothee.title = "my"
        
        let nav1 = UINavigationController(rootViewController: feedVC)
        
        
        setViewControllers([nav1, usedVC, DmVC, myClothee], animated: true)
    }
    
}
