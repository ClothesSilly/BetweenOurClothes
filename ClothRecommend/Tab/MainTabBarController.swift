//
//  MainTabBarController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print(tabBarController)
           return true
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedVC = MainFeedViewController()
        let usedVC = MyClosetViewController()
        
        let addPost = AddPostViewController()
        
        let DmVC = MainFeedViewController()
        let myClothee = MainFeedViewController()
        
        
        
        
        
        
        feedVC.title = "Main"
        usedVC.title = "used"
        addPost.title = "+"
        DmVC.title = "used"
        myClothee.title = "my"
        
        let nav1 = UINavigationController(rootViewController: feedVC)
        
        setViewControllers([nav1, usedVC, addPost, DmVC, myClothee], animated: true)

        if tabBarController(self, shouldSelect: addPost) {
            print("ASdf")
        }
    }
  
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "+" {
            print("need to show ")
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        print(tabBar)
    }
    
}


