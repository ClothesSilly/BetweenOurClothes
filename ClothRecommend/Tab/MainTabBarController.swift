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
        let myClosetVC = MyClosetViewController()
        
        let addPost = AddPostViewController()
        
        let usedTradeVC = UsedTradeViewController()
        let myClothee = MainFeedViewController()
        
        
        
        
        feedVC.title = "Main"
        myClosetVC.title = "내 옷장"
        addPost.title = "+"
        //usedTradeVC.title = "검색(중고)" -> VC init에서 처리함
        myClothee.title = "my"
        
        let nav1 = UINavigationController(rootViewController: feedVC)
        let nav2 = UINavigationController(rootViewController: myClosetVC)
        let nav3 = UINavigationController(rootViewController: usedTradeVC)
        
        setViewControllers([nav1, nav2, addPost, nav3, myClothee], animated: true)

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


