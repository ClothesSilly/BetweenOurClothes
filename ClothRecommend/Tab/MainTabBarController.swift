//
//  MainTabBarController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainTabBarController: UITabBarController {
    
    
    private lazy var homeVC: HomeViewController = {
        let viewController = HomeViewController()
        let tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "mail"),
            tag: 0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var usedTradeVC: UsedTradeViewController = {
        let viewController = UsedTradeViewController()
        let tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "mail"),
            tag: 2)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var wishListVC: WishListViewController = {
        let viewController = WishListViewController()
        let tabBarItem = UITabBarItem(
            title: "찜 목록",
            image: UIImage(systemName: "mail"),
            tag: 3)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var myClosetVC: MyClosetViewController = {
        let viewController = MyClosetViewController()
        let tabBarItem = UITabBarItem(
            title: "내 옷장",
            image: UIImage(systemName: "mail"),
            tag: 4)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    
    let disposeBag = DisposeBag()
    //TabBar 가운데 있을 동그란 버튼 ( 글 작성을 위한 )
    let centerButton = UIButton()
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print(tabBarController)
           return true
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //가운데 글작성 버튼 생성
        self.setupMiddleButton()
               
        let noMean = UIViewController()
        
        // TODO: 가운데 버튼을 누르면 일단 모든 VC로 던져주는데 추후에 문제가 생길 수도 있을 것 같음
        //이렇게 구현하였을 경우, 각 navigationController에서 vc를 갈아끼웠을 경우 신호를 받아 처리하는 것이 화면에 나타나지 않을 수 있다.
        //이를 고려해줘야한다.
        centerButton.rx.tap
            .bind(to: homeVC.centerButtonTapped)
            .disposed(by: disposeBag)
        centerButton.rx.tap
            .bind(to: usedTradeVC.centerButtonTapped1)
            .disposed(by: disposeBag)
        centerButton.rx.tap
            .bind(to: wishListVC.centerButtonTapped)
            .disposed(by: disposeBag)
        centerButton.rx.tap
            .bind(to: myClosetVC.centerButtonTapped)
            .disposed(by: disposeBag)
        
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: usedTradeVC)
        let nav4 = UINavigationController(rootViewController: wishListVC)
        let nav5 = UINavigationController(rootViewController: myClosetVC)
        
        setViewControllers([nav1, nav2, noMean, nav4, nav5], animated: true)
        // 혹시나 center button밑의 TabBar item이 눌리면 안되므로
        self.tabBar.items?[2].isEnabled = false
      
        if tabBarController(self, shouldSelect: noMean) {
            print("noMean clicked")
        }
    }
  
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if item.title == "+" {
//            print("need to show ")
//        }
//
//    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        print(tabBar)
    }
    
    func setupMiddleButton(){
        
        centerButton.layer.cornerRadius = 35.0
        centerButton.clipsToBounds = true
        centerButton.backgroundColor = .white
        centerButton.setImage(UIImage(named: "plus"), for: UIControl.State.normal)
        centerButton.contentMode = .scaleAspectFit
        centerButton.addTarget(self, action: #selector(MainTabBarController.menuButtonAction(sender:)), for: UIControl.Event.touchUpInside)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(centerButton)
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            centerButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
            centerButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            centerButton.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
            centerButton.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            
        }
        else {
//            NSLayoutConstraint(item: centerButton.heightAnchor.constraint(equalToConstant: 56.5).isActive = true, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, multiplier: : 1.0, constant: 0).isActive = true
//
//            NSLayoutConstraint(item: centerButton.heightAnchor.constraint(equalToConstant: 56.5).isActive = true, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: : 1.0, constant: 0).isActive = true
        }
        self.view.layoutIfNeeded()
    }
    @objc func menuButtonAction(sender: UIButton) {
        //self.selectedIndex = 2
        //sender.isHidden = true
        print("center Button clicked")
        let vc = NewPostViewController()
        if let now_navi = self.navigationController {
            now_navi.pushViewController(vc, animated: true)
        }
        else {
            print("null이다")
          
        }
       // self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
